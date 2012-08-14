include Makefile.common
LDFLAGS=$(COMMONFLAGS) -fno-exceptions -ffunction-sections -fdata-sections -L$(LIBDIR) -nostartfiles -Wl,--gc-sections,-Tlinker.ld

LDLIBS+=-lm
LDLIBS+=-lstm32

STARTUP=startup.c
all: libs src
	$(CC) -o $(PROGRAM).elf $(LDFLAGS) \
		-W1,--whole-archive \
		src/app.a \
		-W1,--no-whole-archive \
		$(LDLIBS)
	$(OBJCOPY) -O ihex $(PROGRAM).elf $(PROGRAM).hex
	$(OBJCOPY) -O binary $(PROGRAM).elf $(PROGRAM).bin
	#Extract info contained in ELF to readable text-files:
	arm-none-eabi-readelf -a $(PROGRAM).elf > $(PROGRAM).info_elf
	arm-none-eabi-size -x -t $(PROGRAM).elf > $(PROGRAM).info_size
	#arm-none-eabi-objdump -S $(PROGRAM).elf > $(PROGRAM).info_code

.PHONY:libs src clean

libs:
	$(MAKE) -C libs $@

src:
	$(MAKE) -C src $@

clean:
	$(MAKE) -C src $@
	$(MAKE) -C libs $@
	rm -f $(PROGRAM).elf $(PROGRAM).hex $(PROGRAM).bin $(PROGRAM).info_elf $(PROGRAM).info_size
	#rm -f $(PROGRAM).info_code
