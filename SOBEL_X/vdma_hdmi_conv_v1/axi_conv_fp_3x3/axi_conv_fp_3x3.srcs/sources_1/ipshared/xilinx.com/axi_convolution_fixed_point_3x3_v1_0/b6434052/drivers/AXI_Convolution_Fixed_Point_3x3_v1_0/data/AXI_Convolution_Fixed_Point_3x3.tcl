

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "AXI_Convolution_Fixed_Point_3x3" "NUM_INSTANCES" "DEVICE_ID"  "C_S_AXI_BASEADDR" "C_S_AXI_HIGHADDR"
}
