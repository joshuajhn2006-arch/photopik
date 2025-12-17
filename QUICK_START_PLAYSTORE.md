# Quick Start: Deploy to Play Store

## ⚠️ IMPORTANT: Change Package Name First!

The current package name is `com.photopik.app` - **you MUST change this** to your own unique package name before publishing!

**Files to update:**
1. `android/app/build.gradle.kts` - Change `applicationId` and `namespace`
2. `android/app/src/main/kotlin/com/photopik/app/MainActivity.kt` - Change package name
3. Move the Kotlin directory to match your new package name

## Quick Setup Steps

### 1. Generate Signing Key (One-time setup)

```powershell
keytool -genkey -v -keystore android\keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

**Save the passwords securely!** You'll need them for all future updates.

### 2. Configure Signing

```powershell
# Copy template
Copy-Item android\key.properties.template android\key.properties

# Edit with your keystore info
notepad android\key.properties
```

Fill in:
- `storePassword` = Your keystore password
- `keyPassword` = Your key password  
- `keyAlias` = `upload` (or your alias)
- `storeFile` = `../keystore.jks`

### 3. Build App Bundle

```powershell
flutter build appbundle --release
```

Output: `build/app/outputs/bundle/release/app-release.aab`

### 4. Upload to Play Console

1. Go to [Google Play Console](https://play.google.com/console)
2. Create app → Upload `app-release.aab`
3. Complete store listing
4. Submit for review

## Full Documentation

See `PLAYSTORE_DEPLOYMENT.md` for complete instructions.

## Automated Setup

Run the setup script:
```powershell
.\setup_playstore.ps1
```

