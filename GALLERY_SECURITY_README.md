# Gallery Security Features

PhotoPik now includes comprehensive security features for the gallery to protect your private photos and videos.

## 🔐 Security Features

### Authentication
- **PIN Protection**: Set a 4-8 digit PIN to protect gallery access
- **Biometric Authentication**: Use fingerprint/face ID on supported devices
- **Auto-lock**: Automatically lock gallery after configurable time (1-60 minutes)
- **Access Logging**: Track all gallery access attempts with timestamps

### Privacy Protection
- **Privacy Screen**: Automatically hide content when app goes to background
- **Secure Deletion**: Files are overwritten with random data before deletion (3-pass)
- **Blur Protection**: Content is blurred and locked when backgrounded

## 🚀 How to Use

### First Time Setup
1. Open the Gallery
2. Tap the Security Settings button (🔒 icon) in the app bar
3. Enable "Enable Gallery Security"
4. Set up a PIN (4-8 digits)
5. Optionally enable biometric authentication
6. Configure auto-lock time

### Daily Usage
- Gallery automatically locks based on your settings
- Use PIN or biometrics to unlock
- Privacy screen activates when switching apps
- Secure delete permanently removes files

### Security Settings
Access via the security button in gallery app bar:
- **Enable/Disable Security**: Toggle gallery protection
- **Change PIN**: Update your access PIN
- **Biometric Toggle**: Enable/disable fingerprint/face ID
- **Auto-lock Time**: Set inactivity timeout (1-60 minutes)
- **Access Log**: View security events and timestamps

## 🔒 Technical Security

### Secure Deletion
- 3-pass random data overwrite before file deletion
- Prevents file recovery using forensic tools
- Fallback to regular deletion if secure delete fails

### Access Control
- Rate limiting: Max 5 access attempts per 5-minute window
- Failed attempt logging and blocking
- Platform-specific authentication methods

### Privacy Screen
- Automatic activation when app loses focus
- Content blurring and lock overlay
- Prevents screenshot/shoulder surfing attacks

### Data Protection
- All security settings encrypted in secure storage
- Access logs maintained for security auditing
- No sensitive data stored in plain text

## 📱 Platform Support

### iOS
- Face ID and Touch ID support
- Secure Enclave for biometric data
- App privacy screen integration

### Android
- Fingerprint and Face Unlock
- BiometricPrompt API integration
- Android privacy screen support

### Web
- Browser-based authentication
- HTTPS requirement for camera/gallery access
- Web Crypto API for secure operations

## ⚠️ Important Notes

- **Enable Security**: Gallery is unprotected by default
- **PIN Required**: Must set PIN before enabling security
- **Biometric Optional**: Can use PIN-only authentication
- **Secure Context**: Web version requires HTTPS
- **Backup**: Security settings are device-specific

## 🔧 Troubleshooting

### Can't Access Gallery
- Check if auto-lock timer expired
- Verify PIN/biometric settings
- Try restarting the app

### Biometric Not Working
- Ensure device has biometric setup
- Check app permissions for biometrics
- Verify biometric hardware is functional

### Privacy Screen Issues
- Check if app is running in background
- Verify privacy screen setting is enabled
- Some platforms may have limitations

---

**Security Best Practices:**
- Use strong PINs (avoid 1234, birthdays, etc.)
- Enable biometric authentication when available
- Set reasonable auto-lock times
- Regularly check access logs for suspicious activity
- Keep app updated for latest security features
