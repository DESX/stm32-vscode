info:
DEBUG:=1
include ./nucleo-f0/blink/Makefile

PNT=set($1 $($1))

$(info $(call PNT,C_SOURCES))
$(info $(call PNT,C_INCLUDES))
$(info $(call PNT,C_DEFS))
$(info $(call PNT,ASM_SOURCES))
$(info $(call PNT,ASFLAGS))
$(info $(call PNT,CFLAGS))
$(info $(call PNT,LDFLAGS))
$(info $(call PNT,OBJECTS))

info:
	@echo "foo"
	@echo $(call PNT C_SOURCES)