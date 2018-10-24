# Quick fix for flooding with "incomplete report"

I'm using a laptop with the Elan touchpad (04f3:0c1a), which is handled in 4.18 Linux kernel by i2c-hid module.

Unfortunately my kern.log and syslog gets flooded with "incomplete report" messages whenever I use the touchpad which
fills the log very, very quickly (dozens messages per second).

I did not investigated why the report are incomplete, but simply reduced number of the same messages the module spits
out.

In the original source file I replaced `dev_err` with `dev_err_once`. And I'm importing `hid-ids.h` from the same directory
(the file was copied from the source tree of 4.18 kernel).

To build the module I needed `linux-headers-4.18.0-2-amd64` and `linux-kbuild-4.18`.

Then it just `make` and `make install` (which will just copy the .ko file to the `/lib/modules/...`

Use target `reload` to uninstall current module and install a new one.


