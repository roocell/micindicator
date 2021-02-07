#!/usr/bin/python3

# pizero as bluetooth keyboard

#https://thanhle.me/make-raspberry-pi3-as-an-emulator-bluetooth-keyboard/
#https://mtlynch.io/key-mime-pi/


import RPi.GPIO as GPIO
import os, time, sys, datetime
import logging

# create logger
log = logging.getLogger(__file__)
log.setLevel(logging.DEBUG)
ch = logging.StreamHandler()
ch.setLevel(logging.DEBUG)
formatter = logging.Formatter('%(asctime)s %(levelname)s %(filename)s:%(lineno)d %(message)s')
ch.setFormatter(formatter)
log.addHandler(ch)



def main():


if __name__ == '__main__':
    main()
