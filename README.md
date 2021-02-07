# micindicator

# pizero as bluetooth keyboard
# this project came about because I saw this kickstarter campaign for a
# $35 USB device that was nothing but a mute button with LEDs.
# I thought "I could make that" - let's see.

# keyboards have volume controls so the protocol must have a mute command
# if we emulate a keyboard over bluetooth should be able to control
# the mute function in windows.

# while it's a good opportunity to learn bluetooth. it does make more
# sense to do it over USB so it can power the pizero as well.

# turn raspi into a bluetooth keyboard and mouse
# https://github.com/quangthanh010290/keyboard_mouse_emulate_on_raspberry
# https://thanhle.me/emulate-bluetooth-mouse-with-raspberry-pi/

# emulate a USB keyboard
# sudo vi /usr/bin/isticktoit_usb
# this file gets run at startup (in /etc/rc.local)
https://randomnerdtutorials.com/raspberry-pi-zero-usb-keyboard-hid/
https://makerhacks.com/usb-keyboard-emulation-with-the-raspberry-pi-zero/

# other junk i didn't use
# https://github.com/007durgesh219/BTGamepad
# https://projects-raspberry.com/emulate-a-bluetooth-keyboard-with-the-raspberry-pi/
# https://thanhle.me/make-raspberry-pi3-as-an-emulator-bluetooth-keyboard/
# https://mtlynch.io/key-mime-pi/
# https://github.com/arrase/Raspiducky
# https://impythonist.wordpress.com/2014/02/01/emulate-a-bluetooth-keyboard-with-the-raspberry-pi/
# https://randomnerdtutorials.com/raspberry-pi-zero-usb-keyboard-hid/ - emulate USB keyboard
# https://www.teachmemicro.com/setting-raspberry-pi-zero-bluetooth/
