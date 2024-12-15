#!/bin/bash

# Имя вашего VPN-подключения
VPN_NAME="o.shipulin-0"

# Проверяем текущее состояние VPN
VPN_STATUS=$(nmcli connection show --active | grep "$VPN_NAME")

if [[ -z "$VPN_STATUS" ]]; then
    # Если VPN отключен, подключаем его
    nmcli connection up "$VPN_NAME"
    notify-send "VPN" "Подключение к $VPN_NAME установлено."
else
    # Если VPN подключен, отключаем его
    nmcli connection down "$VPN_NAME"
    notify-send "VPN" "Подключение к $VPN_NAME отключено."
fi
