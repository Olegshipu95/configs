#!/bin/bash

# Основной монитор (например, встроенный экран ноутбука)
PRIMARY_MONITOR="eDP-1"

# Функция для настройки мониторов
setup_monitors() {
    # Проверяем подключенные мониторы
    connected_monitors=$(xrandr | grep " connected" | awk '{print $1}')

    # Отключаем все мониторы, кроме основного
    for monitor in $(xrandr | grep " disconnected" | awk '{print $1}'); do
        xrandr --output "$monitor" --off
    done

    # Настраиваем подключенные мониторы
    for monitor in $connected_monitors; do
        if [[ "$monitor" != "$PRIMARY_MONITOR" ]]; then
            # Если монитор не основной, размещаем его справа от основного
            xrandr --output "$monitor" --auto --right-of "$PRIMARY_MONITOR"
        else
            # Основной монитор оставляем как есть
            xrandr --output "$monitor" --auto
        fi
    done
}

# Вызываем функцию настройки мониторов
setup_monitors