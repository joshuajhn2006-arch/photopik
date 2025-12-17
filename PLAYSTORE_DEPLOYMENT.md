# Play Store Deployment Guide for PhotoPik

This guide will help you prepare and deploy PhotoPik to the Google Play Store.

## Prerequisites

1. **Google Play Console Account**: You need a Google Play Developer account ($25 one-time fee)
2. **Java Development Kit (JDK)**: Required for generating the signing key
3. **Flutter SDK**: Ensure Flutter is properly installed and configured

## Step 1: Update Package Name (IMPORTANT)

⚠️ **CRITICAL**: The package name `com.photopik.app` is currently set as a placeholder. You **MUST** change it to your own unique package name before publishing. Once published, the package name cannot be changed.

### To change the package name:

1. Update `android/app/build.gradle.kts`:
   ```kotlin
   applicationId = "com.yourcompany.photopik"  // Change this!
   namespace = "com.yourcompany.photopik"      // Change this!
   ```

2. Update `android/app/src/main/kotlin/com/example/photopik/MainActivity.kt`:
   ```kotlin
   package com.yourcompany.photopik  // Change this!
   ```

3. Move/rename the Kotlin directory:
   - From: `android/app/src/main/kotlin/com/example/photopik/`
   - To: `android/app/src/main/kotlin/com/yourcompany/photopik/`

4. Update `AndroidManifest.xml` if it references the package directly (it should use namespace automatically)

## Step 2: Create a Signing Key

You need to create a keystore file to sign your app. This key is required for all future updates.

### Generate the keystore:

```bash
keytool -genkey -v -keystore android/keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

**Important**: 
- Store the keystore file and passwords securely
- You'll need this key for all future app updates
- If you lose this key, you cannot update your app on Play Store

You'll be prompted for:
- Keystore password
- Key password (can be same as keystore password)
- Your name, organization, city, state, country code

## Step 3: Configure Signing

1. Copy the template file:
   ```bash
   cp android/key.properties.template android/key.properties
   ```

2. Edit `android/key.properties` and fill in your actual values:
   ```
   storePassword=YOUR_ACTUAL_KEYSTORE_PASSWORD
   keyPassword=YOUR_ACTUAL_KEY_PASSWORD
   keyAlias=upload
   storeFile=../keystore.jks
   ```

3. **IMPORTANT**: Add `android/key.properties` and `android/keystore.jks` to `.gitignore` to avoid committing sensitive information.

## Step 4: Update App Version

Before each release, update the version in `pubspec.yaml`:

```yaml
version: 1.0.0+1
# Format: version_name+build_number
# version_name: shown to users (e.g., 1.0.0)
# build_number: must increment for each release (e.g., +1, +2, +3)
```

For the next release, increment:
- Version name: `1.0.1` (for minor updates) or `2.0.0` (for major updates)
- Build number: `+2` (must be higher than previous)

## Step 5: Build the App Bundle

Google Play requires an Android App Bundle (AAB) file, not an APK.

### Build the release bundle:

```bash
flutter build appbundle --release
```

The output will be at: `build/app/outputs/bundle/release/app-release.aab`

### Alternative: Build APK (for testing)

If you want to test the release build first:

```bash
flutter build apk --release
```

The output will be at: `build/app/outputs/flutter-apk/app-release.apk`

## Step 6: Test the Release Build

Before uploading to Play Store, test the release build:

1. Install on a device:
   ```bash
   flutter install --release
   ```

2. Test all features:
   - Camera functionality
   - Image editing
   - Filters
   - Sharing
   - Gallery access

## Step 7: Prepare Play Store Assets

You'll need to prepare:

1. **App Icon**: 512x512px PNG (no transparency)
2. **Feature Graphic**: 1024x500px PNG
3. **Screenshots**: 
   - Phone: At least 2, up to 8 (16:9 or 9:16)
   - Tablet (if supported): At least 2, up to 8
4. **App Description**: Up to 4000 characters
5. **Short Description**: Up to 80 characters
6. **Privacy Policy URL**: Required for apps that handle user data

## Step 8: Upload to Play Console

1. Go to [Google Play Console](https://play.google.com/console)
2. Create a new app or select existing
3. Fill in all required information:
   - App name: PhotoPik
   - Default language
   - App or game
   - Free or paid
   - Privacy policy
4. Go to "Production" → "Create new release"
5. Upload the `app-release.aab` file
6. Add release notes
7. Review and roll out

## Step 9: Complete Store Listing

Fill in all required fields:
- App description
- Screenshots
- Feature graphic
- App icon
- Category
- Content rating
- Target audience
- Data safety information

## Step 10: Submit for Review

1. Complete all required sections (marked with red warnings)
2. Review the app information
3. Submit for review
4. Wait for Google's review (usually 1-3 days)

## Troubleshooting

### Build Errors

If you encounter build errors:

```bash
# Clean the build
flutter clean

# Get dependencies
flutter pub get

# Try building again
flutter build appbundle --release
```

### Signing Issues

If signing fails:
- Verify `key.properties` file exists and has correct paths
- Check that keystore file path is correct (relative to `android/` directory)
- Ensure passwords are correct

### Version Code Conflicts

If Play Console says version code already exists:
- Increment the build number in `pubspec.yaml`
- Rebuild the app bundle

## Security Best Practices

1. ✅ Never commit `key.properties` or `keystore.jks` to version control
2. ✅ Store keystore file in a secure location (password manager, encrypted drive)
3. ✅ Use strong passwords for keystore and key
4. ✅ Keep backups of your keystore file
5. ✅ Document keystore location and passwords securely

## Additional Resources

- [Flutter App Deployment](https://docs.flutter.dev/deployment/android)
- [Google Play Console Help](https://support.google.com/googleplay/android-developer)
- [Android App Signing](https://developer.android.com/studio/publish/app-signing)

## Quick Reference Commands

```bash
# Build release app bundle
flutter build appbundle --release

# Build release APK (for testing)
flutter build apk --release

# Check app size
flutter build appbundle --release --analyze-size

# Test release build
flutter install --release
```

---

**Note**: Remember to update the package name before your first release!

