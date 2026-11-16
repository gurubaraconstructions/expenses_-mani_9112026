# 📱 ConstructPro APK Build Guide

## 🚀 Quick Start

### 1. Build APK (Debug)
```bash
./build-apk.sh
```

### 2. Build APK (Release for Play Store)
```bash
# First create keystore (one-time setup)
keytool -genkey -v -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000

# Then build release APK
./build-apk.sh
```

## 📋 Prerequisites

### Required Software:
- **Node.js** (already installed)
- **Java JDK 8+** 
- **Android SDK** (Android Studio recommended)
- **Gradle** (comes with Android Studio)

### Environment Variables:
```bash
export ANDROID_HOME=/path/to/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
```

## 🔧 Manual Build Steps

### 1. Install Cordova Globally
```bash
npm install -g cordova
```

### 2. Create Cordova Project
```bash
cordova create constructpro com.constructpro.app ConstructPro
cd constructpro
cordova platform add android
```

### 3. Install Plugins
```bash
cordova plugin add cordova-plugin-camera
cordova plugin add cordova-plugin-geolocation
cordova plugin add cordova-plugin-file
cordova plugin add cordova-plugin-network-information
cordova plugin add cordova-plugin-vibration
cordova plugin add cordova-plugin-whitelist
cordova plugin add cordova-plugin-splashscreen
```

### 4. Build Web App
```bash
npm run build
cp -r dist/* constructpro/www/
```

### 5. Build APK
```bash
cd constructpro
cordova build android
```

## 📱 APK Locations

### Debug APK (for testing):
```
constructpro/platforms/android/app/build/outputs/apk/debug/app-debug.apk
```

### Release APK (for Play Store):
```
constructpro/platforms/android/app/build/outputs/apk/release/app-release.apk
```

## 🏪 Google Play Store Preparation

### 1. Create Keystore (One-time)
```bash
keytool -genkey -v -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
```

### 2. Build Signed APK
```bash
cordova build android --release -- --keystore=../my-release-key.keystore --storePassword=your_password --alias=my-key-alias --password=your_password
```

### 3. Generate App Bundle (Recommended)
```bash
cordova build android --release -- --packageType=bundle
```

## 🎯 App Store Requirements

### App Information:
- **App Name**: ConstructPro
- **Package Name**: com.constructpro.app
- **Version**: 1.0.0
- **Target SDK**: 33 (Android 13)
- **Min SDK**: 24 (Android 7.0)

### Required Assets:
- **App Icon**: 512x512 PNG
- **Screenshots**: Various device sizes
- **Feature Graphic**: 1024x500 PNG
- **Privacy Policy**: Required URL

### Permissions Used:
- Camera (for site photos)
- Location (for GPS tracking)
- Storage (for offline data)
- Internet (for sync)
- Vibration (for feedback)

## 🔍 Testing

### Install Debug APK:
```bash
adb install constructpro/platforms/android/app/build/outputs/apk/debug/app-debug.apk
```

### Test on Device:
1. Enable Developer Options
2. Enable USB Debugging
3. Connect device via USB
4. Run: `adb devices` to verify connection
5. Install and test APK

## 🚀 Deployment Steps

1. **Build Release APK** with keystore
2. **Test thoroughly** on multiple devices
3. **Create Google Play Console account** ($25 fee)
4. **Upload APK/AAB** to Play Console
5. **Fill app information** and store listing
6. **Submit for review**

## 📞 Support

If you encounter issues:
1. Check Android SDK installation
2. Verify environment variables
3. Ensure Java JDK is installed
4. Check Cordova version compatibility

---

**Ready to build your APK!** 🎉