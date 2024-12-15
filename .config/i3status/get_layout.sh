#!/bin/bash

# Запускаем i3status и читаем его вывод построчно
i3status | while :
do
    # Читаем строку из i3status
    read line

    # Получаем текущую активную раскладку с помощью xkblayout-state
    layout=$(xkblayout-state print "%s")

    # Определяем, как отображать раскладку
    case "$layout" in
        "us")
            lang="LANG: EN"
            ;;
        "ru")
            lang="LANG: RU"
            ;;
        *)
            lang="LANG: $layout"
            ;;
    esac

    line=$(echo "$line" | sed 's/||/|/g')  # Удаляем дублирующиеся разделители

done