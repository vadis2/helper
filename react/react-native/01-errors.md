# Errors
## AVA_HOME is not set and no 'java' command could be found in your PATH.
[stackoverflow](https://stackoverflow.com/questions/48298910/react-native-java-home-is-not-set-and-no-java-command-could-be-found-in-your)
### Solution
+ open bash:
````
sudo nano ~/.bashrc
````
insert in the end:
````
export JAVA_HOME=<Your Android Studio path here>/jre
i.e.:
export JAVA_HOME=/opt/Android-studio/jre
````
Activate:
````
. ~/.bashrc
````

## SDK location not found. Define location with sdk.dir in the local.properties file or with an ANDROID_HOME environment variable.
[stackoverflow](https://stackoverflow.com/questions/27620262/sdk-location-not-found-define-location-with-sdk-dir-in-the-local-properties-fil)
### Solution
+ Go to your project/Android
+ create ```local.properties```
+ Insert
````
sdk.dir = /home/USERNAME/Android/Sdk
````
## Failed to install the following Android SDK packages as some licences have not been accepted
[stackoverflow](https://stackoverflow.com/questions/54273412/failed-to-install-the-following-android-sdk-packages-as-some-licences-have-not)
### Solution
````
yes | ~/Android/Sdk/tools/bin/sdkmanager --licenses
````
