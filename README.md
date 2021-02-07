# micindicator
this project came about because I saw this indiegogo campaign for a
$35 USB device that was nothing but a mute button with LEDs.
I thought "I could make that" - let's see.

the mic architecture in windows seems overlay complicated.
surprisingly there is not default hotkey to toggle your mic.
originally i thought having a raspi mimic a keyboard and send a key to the PC
would replicate this device.

while it's a good opportunity to learn bluetooth. it does make more
sense to do it over USB so it can power the pizero as well. we could emulate a
keyboard over USB or bluetooth.

after experimenting with different solutions (with some suggestions from other),
realized a raspi isn't required at all. It could be done just using the
autohotkey app with scripts to do the work (including toggling a Hue bulb).
This may be a good solution for most people

https://www.autohotkey.com/boards/viewtopic.php?t=15509
https://www.howtogeek.com/319428/how-to-control-your-philips-hue-lights-with-keyboard-shortcuts/  

so with that done. let's get back to replicating the indiegogo device

# turn raspi into a bluetooth keyboard and mouse
# https://github.com/quangthanh010290/keyboard_mouse_emulate_on_raspberry
# https://thanhle.me/emulate-bluetooth-mouse-with-raspberry-pi/

# emulate a USB keyboard
https://randomnerdtutorials.com/raspberry-pi-zero-usb-keyboard-hid/
https://makerhacks.com/usb-keyboard-emulation-with-the-raspberry-pi-zero/
http://www.isticktoit.net/?p=1383

be sure to use a OTG USB cable!
i.e. some USB cables won't allow pizero to be detected

sudo vi /usr/bin/isticktoit_usb
this file gets run at startup (in /etc/rc.local)

The simplest way to send keystrokes is by echoing HID packets to the device file:
sudo echo -ne "\0\0\x4\0\0\0\0\0" > /dev/hidg0 #press the A-button
sudo echo -ne "\0\0\0\0\0\0\0\0" > /dev/hidg0 #release all keys

# MSFT usb telephony spec
# this is probably the proper way to do it - but requires commerical device
# and licenses, etc.
http://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/usbtelephony-v091.doc

# craziness - there isn't a standard hotkey to mute your microphone
# need to run an app triggered by a hotkey to do it
# autohotkey
# this is very responsive and works perfectly
# you just need to figure out your device number using the findmic.ahk script
# then modify the togglemute.ahk script with it
https://www.autohotkey.com/
https://www.autohotkey.com/boards/viewtopic.php?t=15509

# haha. don't even need a pi
https://www.howtogeek.com/319428/how-to-control-your-philips-hue-lights-with-keyboard-shortcuts/  

# hotkey to run app
# nirsoft stuff takes forever (up to 7 seconds) to run
https://www.howtogeek.com/howto/windows-vista/create-a-shortcut-or-hotkey-to-mute-the-system-volume-in-windows/
https://www.nirsoft.net/utils/sound_volume_view.html
