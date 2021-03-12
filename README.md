# fix-choppy-A2DP-bluetooth-ubuntu-20.04
If you have problem with lagging bluetooth headphone or device on Ubuntu (even 20.04 LTS), you can use this script to set latency offset of your bluetooth device.
  1. Connect your bluetooth device & find necessary info about the bluetooth device (while it is connected!)
`pactl list | grep -Pzo '.*bluez_card(.*\n)*'`
My case:
  ```
  Name: bluez_card.00_0A_45_03_E5_00
	Driver: module-bluez5-device.c
	Owner Module: 29
	Properties:
		device.description = "ATH-WS660BT"
		device.string = "00:0A:45:03:E5:00"
		device.api = "bluez"
		device.class = "sound"
		device.bus = "bluetooth"
		device.form_factor = "headset"
		bluez.path = "/org/bluez/hci0/dev_00_0A_45_03_E5_00"
		bluez.class = "0x240404"
		bluez.alias = "ATH-WS660BT"
		device.icon_name = "audio-headset-bluetooth"
		device.intended_roles = "phone"
	Profiles:
		headset_head_unit: Headset Head Unit (HSP/HFP) (sinks: 1, sources: 1, priority: 30, available: yes)
		a2dp_sink: High Fidelity Playback (A2DP Sink) (sinks: 1, sources: 0, priority: 40, available: yes)
		off: Off (sinks: 0, sources: 0, priority: 0, available: yes)
	Active Profile: a2dp_sink
	Ports:
		headset-output: Headset (priority: 0, latency offset: 50000 usec, available)
			Part of profile(s): headset_head_unit, a2dp_sink
		headset-input: Headset (priority: 0, latency offset: 0 usec)
			Part of profile(s): headset_head_unit
  ```
  2. Set the buffer size (latency) of your card to a suitable value with this command pattern:
`pactl set-port-latency-offset <NAME> <PORT> <BUFFER_SIZE_MICROSECONDS>`
_ In my case, I'll use: 
`pactl set-port-latency-offset bluez_card.00_0A_45_03_E5_00 headset-output 50000`

That's it. It really worked for me.
I did use solutions here:
[Ref-stackoverflow](thttps://askubuntu.com/questions/475987/a2dp-on-pulseaudio-terrible-choppy-skipping-audio/1207648#1207648?newreg=8db7e525c0e04228872dcd9da8987798)
