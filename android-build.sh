#!/bin/bash

echo "🚀 Building ConstructPro Android APK..."

# Step 1: Install Capacitor if not installed
echo "📦 Installing Capacitor..."
npm install @capacitor/core @capacitor/cli @capacitor/android

# Step 2: Build the web app
echo "🔨 Building web application..."
npm run build

# Step 3: Initialize Capacitor (if not already done)
if [ ! -d "android" ]; then
    echo "⚡ Initializing Capacitor..."
    npx cap add android
fi

# Step 4: Copy web assets to native project
echo "📁 Copying web assets..."
npx cap copy android

# Step 5: Sync Capacitor
echo "🔄 Syncing Capacitor..."
npx cap sync android

# Step 6: Open Android Studio (optional)
echo "📱 Opening Android Studio..."
echo "You can now:"
echo "1. Build APK in Android Studio"
echo "2. Or run: npx cap run android"

# Open Android Studio
npx cap open android

echo "✅ Setup complete!"
echo ""
echo "📋 Next steps:"
echo "1. In Android Studio: Build > Generate Signed Bundle/APK"
echo "2. Choose APK and follow the wizard"
echo "3. Your APK will be in: android/app/build/outputs/apk/"