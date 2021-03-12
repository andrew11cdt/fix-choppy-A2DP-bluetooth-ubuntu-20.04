pactl list | grep -Pzo '.*bluez_card(.*\n)*'
pactl set-port-latency-offset bluez_card.00_0A_45_03_E5_00 headset-output 50000
