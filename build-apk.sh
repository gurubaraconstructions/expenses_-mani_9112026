#!/bin/bash

echo "🚀 Building ConstructPro APK..."

# Step 1: Build the web app
echo "📦 Building web application..."
npm run build

# Step 2: Copy built files to Cordova www directory
echo "📁 Copying files to Cordova..."
cp -r dist/* constructpro/www/

# Step 3: Build the APK
echo "🔨 Building APK..."
cd constructpro

# Build debug APK
cordova build android

# Build release APK (if keystore exists)
if [ -f "../my-release-key.keystore" ]; then
    echo "🔐 Building signed release APK..."
    cordova build android --release -- --keystore="../my-release-key.keystore" --storePassword=your_store_password --alias=my-key-alias --password=your_key_password
else
    echo "⚠️  No keystore found. Building debug APK only."
    echo "💡 To create a keystore for release APK:"
    echo "   keytool -genkey -v -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000"
fi

echo "✅ APK build complete!"
echo "📱 Debug APK location: constructpro/platforms/android/app/build/outputs/apk/debug/app-debug.apk"

if [ -f "platforms/android/app/build/outputs/apk/release/app-release.apk" ]; then
    echo "🎉 Release APK location: constructpro/platforms/android/app/build/outputs/apk/release/app-release.apk"
fi

cd ..