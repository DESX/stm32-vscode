cmake_minimum_required(VERSION 3.10)

project(nucf0-blink C ASM)

set(DIR ${CMAKE_CURRENT_SOURCE_DIR})
set(BASE ${DIR}/nucleo32)

set(DRIVER_SRC ${DIR}/Drivers/STM32L4xx_HAL_Driver/Src)
set(DRIVER_INC ${DIR}/Drivers/STM32L4xx_HAL_Driver/Inc)
set(CORE_SRC ${DIR}/Core/Src)
set(CORE_INC ${DIR}/Core/Inc)

set(C_SOURCES

    ${CORE_SRC}/main.c
    ${CORE_SRC}/stm32l4xx_hal_msp.c  
    ${CORE_SRC}/stm32l4xx_it.c  
    ${CORE_SRC}/system_stm32l4xx.c

    ${BASE}/startup_stm32l432xx.s

    ${DRIVER_SRC}/stm32l4xx_hal_tim.c
    ${DRIVER_SRC}/stm32l4xx_hal_tim_ex.c
    ${DRIVER_SRC}/stm32l4xx_hal_uart.c
    ${DRIVER_SRC}/stm32l4xx_hal_uart_ex.c
    ${DRIVER_SRC}/stm32l4xx_hal.c
    ${DRIVER_SRC}/stm32l4xx_hal_i2c.c
    ${DRIVER_SRC}/stm32l4xx_hal_i2c_ex.c
    ${DRIVER_SRC}/stm32l4xx_hal_rcc.c
    ${DRIVER_SRC}/stm32l4xx_hal_rcc_ex.c
    ${DRIVER_SRC}/stm32l4xx_hal_flash.c
    ${DRIVER_SRC}/stm32l4xx_hal_flash_ex.c
    ${DRIVER_SRC}/stm32l4xx_hal_flash_ramfunc.c
    ${DRIVER_SRC}/stm32l4xx_hal_gpio.c
    ${DRIVER_SRC}/stm32l4xx_hal_dma.c
    ${DRIVER_SRC}/stm32l4xx_hal_dma_ex.c
    ${DRIVER_SRC}/stm32l4xx_hal_pwr.c
    ${DRIVER_SRC}/stm32l4xx_hal_pwr_ex.c
    ${DRIVER_SRC}/stm32l4xx_hal_cortex.c
    ${DRIVER_SRC}/stm32l4xx_hal_exti.c



)


set(C_INCLUDES
    ${CORE_INC}
    ${DRIVER_INC}
    ${DRIVER_INC}/Legacy
    ${DIR}/Drivers/CMSIS/Device/ST/STM32L4xx/Include/
    ${DIR}/Drivers/CMSIS/Include

)

set(C_DEFS
USE_HAL_DRIVER 
STM32L432xx
)
set(CXX_DEFS)
set(AS_DEFS )

set(AS_FLAGS
    -mcpu=cortex-m4
    -mthumb
    -Wall
    )

set(CPP_FLAGS
    -mcpu=cortex-m4
    -mthumb
    -O2
    -Wall
    -Werror
    -fdata-sections
    -ffunction-sections
    -g3
    -gdwarf-2)

set(C_FLAGS
    -mcpu=cortex-m4
    -mthumb
    -O2
    -Wall
    -Werror
    -fdata-sections
    -ffunction-sections
    -g3
    -gdwarf-2)

set(LD_FLAGS
    -mcpu=cortex-m4
    -mthumb
    -specs=nano.specs
    -T${BASE}/STM32L432KCUx_FLASH.ld
    -lc
    -lm
    -lnosys
    -Wl,-Map=${CMAKE_CURRENT_BIN_DIR}/blink.map,--cref
    -Wl,--gc-sections

    )

add_executable(blink2 ${C_SOURCES})

target_include_directories(blink2 PRIVATE 
    $<$<COMPILE_LANGUAGE:C>: ${C_INCLUDES}>
    $<$<COMPILE_LANGUAGE:CXX>: >
    $<$<COMPILE_LANGUAGE:ASM>: >
)

target_compile_definitions(blink2 PRIVATE 
    $<$<COMPILE_LANGUAGE:C>: ${C_DEFS}>
    $<$<COMPILE_LANGUAGE:CXX>: ${CXX_DEFS}>
    $<$<COMPILE_LANGUAGE:ASM>: ${AS_DEFS}>
)

target_compile_options(blink2 PRIVATE 
    $<$<COMPILE_LANGUAGE:C>: ${C_FLAGS}>
    $<$<COMPILE_LANGUAGE:CXX>: ${CXX_FLAGS}>
#    $<$<COMPILE_LANGUAGE:ASM>:-x assembler-with-cpp ${AS_FLAGS}>
    $<$<COMPILE_LANGUAGE:ASM>: ${AS_FLAGS}>
)

target_link_options(blink2 PRIVATE ${LD_FLAGS})