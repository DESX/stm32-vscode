cmake_minimum_required(VERSION 3.10)

project(nucf0-blink C ASM)

set(C_SOURCES
    startup_stm32f030x8.s
    Src/stm32f0xx_hal_msp.c
    Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_tim.c
    Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_tim_ex.c
    Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_rcc.c
    Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_rcc_ex.c
    Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal.c
    Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_i2c.c
    Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_i2c_ex.c
    Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_gpio.c
    Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_dma.c
    Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_cortex.c
    Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_pwr.c
    Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_pwr_ex.c
    Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_flash.c
    Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_flash_ex.c
    Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_exti.c
    Src/system_stm32f0xx.c
    Src/stm32f0xx_it.c
    Src/main.c
     )

set(C_INCLUDES
    Inc
    Drivers/STM32F0xx_HAL_Driver/Inc
    Drivers/STM32F0xx_HAL_Driver/Inc/Legacy
    Drivers/CMSIS/Device/ST/STM32F0xx/Include
    Drivers/CMSIS/Include)

set(C_DEFS
    USE_HAL_DRIVER
    STM32F030x8
    )
set(CXX_DEFS)
set(AS_DEFS )

set(AS_FLAGS
    -mcpu=cortex-m0
    -mthumb
    -Wall
    )

set(CPP_FLAGS
    -mcpu=cortex-m0
    -mthumb
    -O2
    -Wall
    -Werror
    -fdata-sections
    -ffunction-sections
    -g3
    -gdwarf-2)
set(C_FLAGS
    -mcpu=cortex-m0
    -mthumb
    -O2
    -Wall
    -Werror
    -fdata-sections
    -ffunction-sections
    -g3
    -gdwarf-2)

set(LD_FLAGS
    -mcpu=cortex-m0
    -mthumb
    -specs=nano.specs
    -T${CMAKE_CURRENT_SOURCE_DIR}/STM32F030R8Tx_FLASH.ld
    -lc
    -lm
    -lnosys
    -Wl,-Map=${CMAKE_CURRENT_BIN_DIR}/blink.map,--cref
    -Wl,--gc-sections

    )

add_executable(blink ${C_SOURCES})

target_include_directories(blink PRIVATE 
    $<$<COMPILE_LANGUAGE:C>: ${C_INCLUDES}>
    $<$<COMPILE_LANGUAGE:CXX>: >
    $<$<COMPILE_LANGUAGE:ASM>: >
)

target_compile_definitions(blink PRIVATE 
    $<$<COMPILE_LANGUAGE:C>: ${C_DEFS}>
    $<$<COMPILE_LANGUAGE:CXX>: ${CXX_DEFS}>
    $<$<COMPILE_LANGUAGE:ASM>: ${AS_DEFS}>
)

target_compile_options(blink PRIVATE 
    $<$<COMPILE_LANGUAGE:C>: ${C_FLAGS}>
    $<$<COMPILE_LANGUAGE:CXX>: ${CXX_FLAGS}>
#    $<$<COMPILE_LANGUAGE:ASM>:-x assembler-with-cpp ${AS_FLAGS}>
    $<$<COMPILE_LANGUAGE:ASM>: ${AS_FLAGS}>
)

target_link_options(blink PRIVATE ${LD_FLAGS})