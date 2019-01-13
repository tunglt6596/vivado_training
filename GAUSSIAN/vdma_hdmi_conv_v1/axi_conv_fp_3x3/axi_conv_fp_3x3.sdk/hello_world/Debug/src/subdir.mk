################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/common.c \
../src/hdmi_display.c \
../src/helloworld.c \
../src/platform.c \
../src/ps7_init.c 

OBJS += \
./src/common.o \
./src/hdmi_display.o \
./src/helloworld.o \
./src/platform.o \
./src/ps7_init.o 

C_DEPS += \
./src/common.d \
./src/hdmi_display.d \
./src/helloworld.d \
./src/platform.d \
./src/ps7_init.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I../../hello_world_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


