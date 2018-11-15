MOD=i2c-hid
obj-m += $(MOD).o
 
all:
	@echo "Targets:"
	@echo " build   - compiles module"
	@echo " clean   - cleans the directory"
	@echo " install - copies built module to /lib/modules/... - calls sudo"
	@echo " reload  - unloads and load the module - calls sudo"

build: $(MOD).ko
$(MOD).ko:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
 
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

install: $(MOD).ko
	sudo cp -v $(MOD).ko /lib/modules/$(shell uname -r)/kernel/drivers/hid/i2c-hid

reload: $(MOD).ko
	sudo modprobe -rv $(MOD)
	sudo modprobe -v $(MOD)
