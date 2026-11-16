# 📱 ConstructPro Android APK Build Guide

## 🚀 Quick Start

### Method 1: Install as PWA (Recommended)
1. **Open Chrome** on your Android phone
2. **Go to**: https://sunny-quokka-d3fd60.netlify.app
3. **Tap menu (⋮)** → **"Add to Home screen"**
4. **Tap "Add"** - App installs like native app!

### Method 2: Build APK

## 📋 Prerequisites

### Required Software:
- **Node.js** (already installed ✅)
- **Android Studio** ([Download here](https://developer.android.com/studio))
- **Java JDK 11+** (comes with Android Studio)

## 🔧 Build Steps

### 1. Install Dependencies
```bash
npm install @capacitor/core @capacitor/cli @capacitor/android
```

### 2. Run Build Script
```bash
chmod +x android-build.sh
./android-build.sh
```

### 3. In Android Studio
1. **Wait for Gradle sync** to complete
2. **Build > Generate Signed Bundle/APK**
3. **Choose APK**
4. **Create keystore** (first time only):
   - Key store path: `my-release-key.keystore`
   - Password: `your_password`
   - Key alias: `my-key-alias`
   - Key password: `your_key_password`
5. **Build APK**

### 4. Find Your APK
```
android/app/build/outputs/apk/debug/app-debug.apk
android/app/build/outputs/apk/release/app-release.apk
```

## 📱 Install APK on Phone

### Method A: Direct Install
1. **Copy APK** to your phone
2. **Open file manager** → find APK
3. **Tap APK** → **Install**
4. **Enable "Unknown sources"** if prompted

### Method B: ADB Install
```bash
# Connect phone via USB (Developer mode enabled)
adb install android/app/build/outputs/apk/debug/app-debug.apk
```

## 🏪 Google Play Store

### For Play Store Upload:
1. **Build signed APK** (release version)
2. **Create Google Play Console account** ($25 fee)
3. **Upload APK** to Play Console
4. **Fill app details** and submit for review

## 🎯 App Features

### ✅ Native Android Features:
- **Offline functionality**
- **Home screen icon**
- **Full screen experience**
- **Camera access** for site photos
- **GPS location** for site tracking
- **Local storage** for offline data
- **Push notifications** (if needed)

## 🔧 Troubleshooting

### Common Issues:
1. **Gradle sync failed**: Update Android Studio
2. **Build failed**: Check Java JDK version
3. **APK won't install**: Enable unknown sources
4. **App crashes**: Check device compatibility

### Minimum Requirements:
- **Android 7.0** (API level 24)
- **2GB RAM**
- **100MB storage**

## 📞 Support Commands

```bash
# Build and run on connected device
npm run android:run

# Open Android Studio
npm run android:open

# Build web assets only
npm run android:build

# Check connected devices
adb devices
```

---

**🎉 Your ConstructPro app is ready for Android!**