#!/bin/bash

PROXY_IP=`ifconfig en0 | grep 'inet ' | awk '{printf $2}'`
PROXY_PORT=8888
KEYCODE_TAB=61
KEYCODE_ENTER=66
KEYCODE_DOWN=20

echo "Setting up proxy to $PROXY_IP:$PROXY_PORT"

## Select Modify network
#adb shell input keyevent $KEYCODE_DOWN
#adb shell input keyevent $KEYCODE_DOWN
#adb shell input keyevent $KEYCODE_ENTER
#
## Select manual proxy
#adb shell input keyevent $KEYCODE_ENTER
#adb shell input keyevent $KEYCODE_TAB
#adb shell input keyevent $KEYCODE_ENTER
#adb shell input keyevent $KEYCODE_DOWN
#adb shell input keyevent $KEYCODE_ENTER
#
## Enter proxy details
#adb shell input keyevent $KEYCODE_TAB
adb shell input text $PROXY_IP
adb shell input keyevent $KEYCODE_TAB
adb shell input text $PROXY_PORT
adb shell input keyevent $KEYCODE_TAB
adb shell input text localhost

## Save network details
#adb shell input keyevent $KEYCODE_TAB
#adb shell input keyevent $KEYCODE_TAB
#adb shell input keyevent $KEYCODE_TAB
#adb shell input keyevent $KEYCODE_ENTER

echo "all done"
