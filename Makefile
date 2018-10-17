MOD=i2c-hid
obj-m += $(MOD).o
 
$(MOD).ko:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
 
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

install: $(MOD).ko
	sudo cp -v $(MOD).ko /lib/modules/$(shell uname -r)/kernel/drivers/hid/i2c-hid

