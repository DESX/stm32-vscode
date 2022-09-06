set(BASE_NAME arm-none-eabi)

SET(CMAKE_C_COMPILER    ${BASE_NAME}-gcc      )
SET(CMAKE_CXX_COMPILER  ${BASE_NAME}-g++      )
SET(CMAKE_LINKER        ${BASE_NAME}-ld       )
SET(CMAKE_ASM_COMPILER  ${BASE_NAME}-as       )
SET(CMAKE_OBJCOPY       ${BASE_NAME}-objcopy  )
SET(CMAKE_STRIP         ${BASE_NAME}-strip    )
SET(CMAKE_CPP           ${BASE_NAME}-cpp      )

message("--------------------------")

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
set(CMAKE_SYSTEM_NAME          Generic)
set(CMAKE_HOST_SYSTEM_NAME     Windows)
set(CMAKE_SYSTEM_PROCESSOR     ARM2)

set(CMAKE_EXECUTABLE_SUFFIX    ".elf")

#set(CMAKE_C_FLAGS   "" CACHE STRING "" )
#set(CMAKE_CXX_FLAGS "" CACHE STRING "" )
#set(CMAKE_ASM_FLAGS "" CACHE STRING "" )
#set(CMAKE_ASM_FLAGS "" CACHE STRING "" )
#set(CMAKE_EXE_LINKER_FLAGS   "" CACHE STRING "")
