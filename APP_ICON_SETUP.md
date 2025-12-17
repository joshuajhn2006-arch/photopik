# App Icon Setup Guide for PhotoPik

## 📱 Where to Place Your App Icons

You have an app icon folder with subfolders. Here's exactly where to place each one:

---

## 🤖 **Android Icons**

### Location:
Copy all files from your `appicon/android/` folder to:

```
android/app/src/main/res/
```

### Structure:
Your `android` folder should contain these subfolders:
- `mipmap-hdpi/` → Copy `ic_launcher.png` to `android/app/src/main/res/mipmap-hdpi/`
- `mipmap-mdpi/` → Copy `ic_launcher.png` to `android/app/src/main/res/mipmap-mdpi/`
- `mipmap-xhdpi/` → Copy `ic_launcher.png` to `android/app/src/main/res/mipmap-xhdpi/`
- `mipmap-xxhdpi/` → Copy `ic_launcher.png` to `android/app/src/main/res/mipmap-xxhdpi/`
- `mipmap-xxxhdpi/` → Copy `ic_launcher.png` to `android/app/src/main/res/mipmap-xxxhdpi/`

### Quick Copy Command (if using terminal):
```bash
# Replace YOUR_APPICON_FOLDER with the path to your appicon folder
cp -r YOUR_APPICON_FOLDER/android/* android/app/src/main/res/
```

---

## 🍎 **iOS Icons**

### Location:
Copy all files from your `appicon/Assets.xcassets/AppIcon.appiconset/` folder to:

```
ios/Runner/Assets.xcassets/AppIcon.appiconset/
```

### What to copy:
- All `.png` icon files (Icon-App-*.png)
- The `Contents.json` file (if it exists, or keep the existing one)

### Important:
- Make sure the filenames match what's in `Contents.json`
- Don't delete the existing `Contents.json` unless your new one has the same structure

### Quick Copy Command (if using terminal):
```bash
# Replace YOUR_APPICON_FOLDER with the path to your appicon folder
cp YOUR_APPICON_FOLDER/Assets.xcassets/AppIcon.appiconset/*.png ios/Runner/Assets.xcassets/AppIcon.appiconset/
```

---

## 📦 **App Store & Play Store Assets**

The `appstore` and `playstore` folders are for:
- **App Store (iOS)**: Marketing screenshots, app preview videos, promotional images
- **Play Store (Android)**: Feature graphics, screenshots, promotional images

These are NOT app icons - they're for your store listing pages. You'll upload these when you publish your app to the stores.

---

## ✅ **Verification Steps**

After copying the icons:

1. **For Android**: 
   - Check that `ic_launcher.png` exists in all 5 mipmap folders
   - Run: `flutter clean && flutter pub get`

2. **For iOS**:
   - Check that all icon PNG files are in `ios/Runner/Assets.xcassets/AppIcon.appiconset/`
   - Open Xcode and verify icons appear correctly

3. **Test the app**:
   ```bash
   flutter run
   ```
   - Check the app icon appears on your device/emulator home screen

---

## 🎨 **Icon Requirements**

### Android:
- Format: PNG
- Name: `ic_launcher.png` (must be exact)
- Sizes needed:
  - mdpi: 48x48px
  - hdpi: 72x72px
  - xhdpi: 96x96px
  - xxhdpi: 144x144px
  - xxxhdpi: 192x192px

### iOS:
- Format: PNG (no transparency for app icon)
- Various sizes from 20x20 to 1024x1024
- All sizes should be in `AppIcon.appiconset` folder

---

## 🔄 **After Updating Icons**

1. Clean the build:
   ```bash
   flutter clean
   ```

2. Rebuild the app:
   ```bash
   flutter run
   ```

3. For iOS, you may need to:
   - Open Xcode: `open ios/Runner.xcworkspace`
   - Clean build folder (Product → Clean Build Folder)
   - Rebuild in Xcode

---

## 📝 **Notes**

- The app icon folder structure you have is standard for icon generators
- Always keep backups of your original icons
- Icons may take a few minutes to update on devices after installation
- For production builds, ensure all icon sizes are present

