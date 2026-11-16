# 💻 ConstructPro Desktop Installation Guide

## 🚀 Quick Install (Recommended)

### **Method 1: Run as Desktop App**
```bash
# Install desktop dependencies
npm install

# Run as desktop app
npm run electron
```

**✅ Done!** The app opens as a native desktop application!

## 📦 Method 2: Build Installer

### **Build Desktop Installer:**
```bash
# Build production installer
npm run dist
```

### **Installer Locations:**
- **Windows**: `dist-electron/ConstructPro Setup.exe`
- **Mac**: `dist-electron/ConstructPro.dmg`
- **Linux**: `dist-electron/ConstructPro.AppImage`

## 🎯 **Desktop Features:**

### **✅ Native Desktop Experience:**
- **Window controls** (minimize, maximize, close)
- **Menu bar** with File, View, Window menus
- **Keyboard shortcuts** (Ctrl+N for new site)
- **System tray integration**
- **Auto-updater ready**

### **✅ Offline Functionality:**
- **Works without internet**
- **Local data storage**
- **Fast performance**
- **No browser required**

### **✅ Professional Look:**
- **Custom app icon**
- **Branded window title**
- **Native OS integration**
- **Proper installer**

## 🔧 **Development Mode:**

### **Run in Development:**
```bash
npm run electron-dev
```

### **Features:**
- **Hot reload** - Changes update automatically
- **Developer tools** - Debug console available
- **Live editing** - Edit code and see changes

## 📋 **System Requirements:**

### **Windows:**
- Windows 7 or later
- 2GB RAM minimum
- 100MB disk space

### **Mac:**
- macOS 10.10 or later
- 2GB RAM minimum
- 100MB disk space

### **Linux:**
- Ubuntu 16.04 or equivalent
- 2GB RAM minimum
- 100MB disk space

## 🎉 **Installation Steps:**

### **Step 1: Download/Clone**
```bash
git clone <your-repo-url>
cd constructpro
```

### **Step 2: Install Dependencies**
```bash
npm install
```

### **Step 3: Run Desktop App**
```bash
npm run electron
```

### **Step 4: (Optional) Build Installer**
```bash
npm run dist
```

## 🔄 **Auto-Updates:**

The desktop app is configured for auto-updates:
- **Checks for updates** on startup
- **Downloads in background**
- **Prompts user** to restart for update
- **Seamless update process**

## 📞 **Troubleshooting:**

### **Common Issues:**

1. **"electron not found"**
   ```bash
   npm install electron --save-dev
   ```

2. **"Build failed"**
   ```bash
   npm run build
   npm run dist
   ```

3. **"Permission denied" (Linux)**
   ```bash
   chmod +x dist-electron/ConstructPro.AppImage
   ```

---

**🎉 Your ConstructPro desktop app is ready!**

**Quick Start:** Just run `npm run electron` and enjoy your professional construction management app on desktop! 💻