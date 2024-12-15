#!/bin/bash

# Поиск ID тачпада
TOUCHPAD_ID=$(xinput list | grep -i "Touchpad" | grep -oP 'id=\K\d+')

# Проверка, найден ли тачпад
if [ -z "$TOUCHPAD_ID" ]; then
    echo "Тачпад не найден."
    exit 1
fi

# Применение Natural Scrolling
xinput set-prop $TOUCHPAD_ID "libinput Natural Scrolling Enabled" 1

