################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/DigitalIoPin.cpp \
../src/cr_cpp_config.cpp \
../src/cr_startup_lpc15xx.cpp \
../src/io.cpp \
../src/lab02-ex3.cpp \
../src/menu.cpp \
../src/printer.cpp 

C_SRCS += \
../src/ITM_write.c \
../src/crp.c \
../src/sysinit.c 

OBJS += \
./src/DigitalIoPin.o \
./src/ITM_write.o \
./src/cr_cpp_config.o \
./src/cr_startup_lpc15xx.o \
./src/crp.o \
./src/io.o \
./src/lab02-ex3.o \
./src/menu.o \
./src/printer.o \
./src/sysinit.o 

CPP_DEPS += \
./src/DigitalIoPin.d \
./src/cr_cpp_config.d \
./src/cr_startup_lpc15xx.d \
./src/io.d \
./src/lab02-ex3.d \
./src/menu.d \
./src/printer.d 

C_DEPS += \
./src/ITM_write.d \
./src/crp.d \
./src/sysinit.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C++ Compiler'
	arm-none-eabi-c++ -DDEBUG -D__CODE_RED -D__NEWLIB__ -DCORE_M3 -D__USE_LPCOPEN -DCPP_USE_HEAP -D__LPC15XX__ -I"/Users/DucVoo/Documents/MCUXpressoIDE_11.0.0/workspace cpp/lpc_board_nxp_lpcxpresso_1549/inc" -I"/Users/DucVoo/Documents/MCUXpressoIDE_11.0.0/workspace cpp/lpc_chip_15xx/inc" -O0 -fno-common -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -fno-rtti -fno-exceptions -mcpu=cortex-m3 -mthumb -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__CODE_RED -D__NEWLIB__ -DCORE_M3 -D__USE_LPCOPEN -DCPP_USE_HEAP -D__LPC15XX__ -I"/Users/DucVoo/Documents/MCUXpressoIDE_11.0.0/workspace cpp/lpc_board_nxp_lpcxpresso_1549/inc" -I"/Users/DucVoo/Documents/MCUXpressoIDE_11.0.0/workspace cpp/lpc_chip_15xx/inc" -O0 -fno-common -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m3 -mthumb -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


