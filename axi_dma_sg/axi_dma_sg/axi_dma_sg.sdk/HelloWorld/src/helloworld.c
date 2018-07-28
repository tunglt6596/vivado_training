#include <stdio.h>
#include <sleep.h>
#include "platform.h"
#include "ps7_init.h"
#include <xil_io.h>
#include "xscugic.h"
#include "xparameters.h"

XScuGic InterruptController;
static XScuGic_Config *GicConfig;
u32 global_frame_counter = 0;

//////////////////////////////////////////////////////////////
//
// Start DMA Transfer
/////////////////////////////////////////////////////////////
void StartDMATransfer( unsigned int dstAddress, unsigned int len ) {

	// write destination address to S2MM_DA register.
	Xil_Out32( XPAR_AXI_DMA_0_BASEADDR + 0x48, dstAddress );

	// write length to S2MM_LENGTH register.
	Xil_Out32( XPAR_AXI_DMA_0_BASEADDR + 0x58, len );
}

void InterruptHandler( void ) {
	u32 tmpValue;

	tmpValue = Xil_In32( XPAR_AXI_DMA_0_BASEADDR + 0x34 );
	tmpValue = tmpValue | 0x1000;
	Xil_Out32( XPAR_AXI_DMA_0_BASEADDR + 0x34, tmpValue );

	global_frame_counter++;
	if( global_frame_counter > 10000000 ) {
		xil_printf( "Frame number: %d\n\r", global_frame_counter );
		return;
	}

	StartDMATransfer(0xa000000, 256);
}

int SetupInterruptSystem( XScuGic *XScuGicInstancePtr ) {
	Xil_ExceptionRegisterHandler( XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler) XScuGic_InterruptHandler, XScuGicInstancePtr);
	Xil_ExceptionEnable();		// enable interrupt in ARM.
	return XST_SUCCESS;
}

int InitializeInterruptSystem( deviceID ) {
	int Status;

	GicConfig = XScuGic_LookupConfig( deviceID );
	if( NULL == GicConfig ) {
		return XST_FAILURE;
	}

	Status = XScuGic_CfgInitialize( &InterruptController, GicConfig, GicConfig->CpuBaseAddress);
	if( Status != XST_SUCCESS ) {
		return XST_FAILURE;
	}

	Status = SetupInterruptSystem( &InterruptController );
	if( Status != XST_SUCCESS ) {
			return XST_FAILURE;
	}

	Status = XScuGic_Connect( &InterruptController,
			XPAR_FABRIC_AXI_DMA_0_S2MM_INTROUT_INTR,
			(Xil_ExceptionHandler)InterruptHandler,
			NULL );
	if( Status != XST_SUCCESS ) {
		return XST_FAILURE;
	}

	XScuGic_Enable( &InterruptController,
			XPAR_FABRIC_AXI_DMA_0_S2MM_INTROUT_INTR );

	xil_printf("Setup interrupt handler successfully\n\r");
	return XST_SUCCESS;
}

//////////////////////////////////////////////////////////////
//
// Enable Sample Generator
/////////////////////////////////////////////////////////////
int EnableSampleGenerator( unsigned int numberOfWords ) {

	// set the gpios direction as output
	// the gpios is by default output, so this is not needed.

	// enable the SampleGenerator
	Xil_Out32( XPAR_AXI_GPIO_0_BASEADDR, 1 );

	// set the value for FrameSize
	Xil_Out32( XPAR_AXI_GPIO_1_BASEADDR, numberOfWords );

	return 0;
}

//////////////////////////////////////////////////////////////
//
// Initialize AXI DMA
/////////////////////////////////////////////////////////////
int InitializeAXIDma( void ) {
	unsigned int tmpVal;

	// S2MM_DMACR.RS = 1
	tmpVal = Xil_In32( XPAR_AXI_DMA_0_BASEADDR + 0x30 );
	tmpVal = tmpVal | 0x1001;							// dma unit enable, interrupt on complete enable
	Xil_Out32( XPAR_AXI_DMA_0_BASEADDR + 0x30, tmpVal );
	tmpVal = Xil_In32( XPAR_AXI_DMA_0_BASEADDR + 0x30 );
	xil_printf( "value for dma control register: %x\n\r", tmpVal );

	return 0;
}

int main()
{
    init_platform();

    // enable the pl
    ps7_post_config();

    //
    xil_printf("initializing axi dma...\n\r");
    InitializeAXIDma();

    // enable sample generator
    // end of frame will come after 128 bytes (32 words) are transferred.
    xil_printf("setting up SampleGenerator unit...\n\r");
    EnableSampleGenerator( 32 );

    // set the interrupt system and interrupt handling
    // interrupt
    xil_printf("enabling the interrupt handling system...\n\r");
    InitializeInterruptSystem( XPAR_PS7_SCUGIC_0_DEVICE_ID );

    // start the first dma transfer
    xil_printf("performing the first dma transfer... press a key to begin...\n\r");
    getchar();

    StartDMATransfer( 0xa000000, 256 );

    return 0;
}