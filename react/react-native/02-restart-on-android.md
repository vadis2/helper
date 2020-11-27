# Install on Android
## Link
[Running On Device](https://reactnative.dev/docs/running-on-device)


## Redmi Note. Steps for MIUI 9 and Above:
[How to find settings in a mobile](https://migeek.ru/questions/otladka-po-usb-xiaomi)
### Settings -> Additional Settings -> Developer options ->
+ Turn off "MIUI optimization"
+ Restart
+ Turn On "USB Debugging"
+ Turn On "Install via USB"
+ Set USB Configuration to Charging
+ Turn On "install via USB

(MTP(Media Transfer Protocol) is the default mode.
Works even in MTP in some cases) ?

## Fix errors/make tasks: 01-errors.md

## Check mobile with USB
````
lsusb
````
Find your device (unplug/plug).

Grab the first four digits from the device ID: 22b8:2e76

Execute with your digits!:
````
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="22b8", MODE="0666", GROUP="plugdev"' | sudo tee /etc/udev/rules.d/51-android-usb.rules
````

Check again:
````
adb devices
````
## Go to your project and
````
npx react-native run-android
````

