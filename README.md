# Campus Cruise
Repository for the final project of CS522 @ UIC Fall '23

#### A ridesharing application for university students

## Installing the Application

This app is currently deployed for Android 13 and up, and thus requires a device that meets those specifications.
<br>
To install the application on an android device:<br>
1) Download the apk file from the repository to the device.<br>
2) Navigate to the location with the .apk file and tap on it.<br>
3) If the user has not installed an application from an 'Unknown Source' before this, the device will pop up an alert that asks the user to enable `Install from Unknown Sources`. The exact mechanism of performing this action varies by manufacturer.<br>
On Samsung devices (the device used during development), if the user navigates to the .apk from the `My Files` application, the device asks the user to enable the option for `Install from Unknown Sources` for the `My Files` application.<br>
4) Once the user has given the required permission, the app will install and be available to launch from the app drawer.<br>

## Launching the application for debugging

To use the application in debugging mode, the user needs to have Android Studio installed, with Android SDK 33, and the plugins for Flutter and Dart.<br>
1) Clone the git repo.<br>
2) Launch Android Studio and open the project.<br>
3) Either create a virtual device or connect an android device. Please note - a physical device being used for debugging must have it's developer settings enabled, and needs USB Debugging to be turned on.<br>
4) Launch the application from login.<br>

