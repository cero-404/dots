#!/bin/bash

while true; do
    uptime=$(uptime -p | sed 's/up //')
    temp=$(awk '{printf("%.1f", $1/1000)}' /sys/class/thermal/thermal_zone0/temp)
    cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
    ram=$(free | awk '/Mem:/ {printf "%.1f", $3/$2 * 100}')
    disk=$(df -h / | awk 'NR==2 {print $4}')
    brightness=$(brightnessctl -m | cut -d',' -f4)
    datetime=$(date "+%A, %B %-d")
    battery_perc=$(cat /sys/class/power_supply/BAT1/capacity)
    battery_state=$(cat /sys/class/power_supply/BAT1/status)

    echo " 󱚝 $uptime |  $temp°C |  ${cpu}% |  ${ram}% |  $disk | 󰃝 $brightness | $datetime |  ${battery_perc}% $battery_state"
    sleep 1
done
