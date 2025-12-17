# PhotoPik Play Store Setup Script
# This script helps you set up signing for Play Store deployment

Write-Host "=== PhotoPik Play Store Setup ===" -ForegroundColor Cyan
Write-Host ""

# Check if key.properties already exists
if (Test-Path "android\key.properties") {
    Write-Host "WARNING: key.properties already exists!" -ForegroundColor Yellow
    $overwrite = Read-Host "Do you want to overwrite it? (y/N)"
    if ($overwrite -ne "y" -and $overwrite -ne "Y") {
        Write-Host "Setup cancelled." -ForegroundColor Red
        exit
    }
}

# Check if keystore already exists
if (Test-Path "android\keystore.jks") {
    Write-Host "INFO: keystore.jks already exists. Skipping keystore generation." -ForegroundColor Green
    Write-Host ""
} else {
    Write-Host "Step 1: Generate Signing Keystore" -ForegroundColor Yellow
    Write-Host "You need to create a keystore file to sign your app." -ForegroundColor White
    Write-Host "This keystore is REQUIRED for Play Store deployment." -ForegroundColor White
    Write-Host ""
    Write-Host "Run this command to generate the keystore:" -ForegroundColor Cyan
    Write-Host "  keytool -genkey -v -keystore android\keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload" -ForegroundColor White
    Write-Host ""
    $generate = Read-Host "Have you generated the keystore? (y/N)"
    if ($generate -ne "y" -and $generate -ne "Y") {
        Write-Host "Please generate the keystore first, then run this script again." -ForegroundColor Red
        exit
    }
}

# Create key.properties from template
Write-Host ""
Write-Host "Step 2: Configure Signing Properties" -ForegroundColor Yellow

if (-not (Test-Path "android\key.properties.template")) {
    Write-Host "ERROR: key.properties.template not found!" -ForegroundColor Red
    exit
}

Copy-Item "android\key.properties.template" "android\key.properties"

Write-Host "Please edit android\key.properties and fill in your keystore information:" -ForegroundColor White
Write-Host "  - storePassword: Your keystore password" -ForegroundColor Gray
Write-Host "  - keyPassword: Your key password (can be same as keystore)" -ForegroundColor Gray
Write-Host "  - keyAlias: Your key alias (usually 'upload')" -ForegroundColor Gray
Write-Host "  - storeFile: Path to keystore (should be '../keystore.jks')" -ForegroundColor Gray
Write-Host ""

# Open the file for editing
$editor = $env:EDITOR
if (-not $editor) {
    $editor = "notepad"
}

$open = Read-Host "Open key.properties for editing? (Y/n)"
if ($open -ne "n" -and $open -ne "N") {
    Start-Process $editor "android\key.properties"
}

Write-Host ""
Write-Host "Step 3: Verify Configuration" -ForegroundColor Yellow
Write-Host ""
Write-Host "Before building, make sure:" -ForegroundColor White
Write-Host "  1. Package name is updated in android/app/build.gradle.kts" -ForegroundColor Gray
Write-Host "  2. key.properties is filled with correct values" -ForegroundColor Gray
Write-Host "  3. keystore.jks exists in android/ directory" -ForegroundColor Gray
Write-Host ""

# Check package name
$buildGradle = Get-Content "android\app\build.gradle.kts" -Raw
if ($buildGradle -match 'applicationId = "com\.photopik\.app"') {
    Write-Host "WARNING: Package name is still set to com.photopik.app" -ForegroundColor Yellow
    Write-Host "You should change this to your own unique package name before publishing!" -ForegroundColor Yellow
    Write-Host ""
}

Write-Host "Next steps:" -ForegroundColor Green
Write-Host "  1. Edit android/key.properties with your keystore information" -ForegroundColor White
Write-Host "  2. Update package name in android/app/build.gradle.kts (if needed)" -ForegroundColor White
Write-Host "  3. Build the app bundle: flutter build appbundle --release" -ForegroundColor White
Write-Host "  4. Upload to Play Console" -ForegroundColor White
Write-Host ""
Write-Host "For detailed instructions, see PLAYSTORE_DEPLOYMENT.md" -ForegroundColor Cyan

