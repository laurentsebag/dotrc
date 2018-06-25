#!/bin/bash

KEYCODE_ENTER=66
KEYCODE_LEFT=21

inputText () {
    text=$1
    adb shell input text ${text}
}

inputKey () {
    keycode=$1
    adb shell input keyevent ${keycode}
}

login () {
    username=$1
    password=$2

    echo "logging in"
    inputText ${username}
    inputKey ${KEYCODE_ENTER}
    # Avoid bug where 1st character is typed in twice
    inputKey ${KEYCODE_LEFT}
    inputText ${password}
    inputKey ${KEYCODE_ENTER}
}

if [ $# -ne 2 ]; then
    command_name=`basename $0`
    echo "Usage: ${command_name} username password" >&2
    exit 1
fi

username=$1
password=$2

login $username $password
