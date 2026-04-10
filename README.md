<p align="center">
  <img src="logo/QR - Barcode Scanner.512x512.png" width="120" alt="QR & Barcode Scanner Logo"/>
</p>

<h2 align="center">QR & Barcode Scanner</h1>

<p align="center">
  Fast, offline QR code and barcode scanner & generator.<br/>
  All data is processed locally on your device.
</p>

---

## Features

**Scan**
- Real-time QR code & barcode scanning via camera
- Scan from gallery images
- Bulk scan mode for multiple codes
- Haptic feedback (vibration & beep sound)
- Auto-copy to clipboard & auto-open URLs

**Generate**
- QR Code: Text, URL, Wi-Fi, Contact, Email, Phone, SMS, Location, Calendar Event
- Barcode: EAN-13, EAN-8, UPC-A, Code 39, Code 128, ITF, Codabar
- Save & share generated images

**Manage**
- Scan history with search & filters
- Favorites / bookmarks
- Stored images management (view & delete)

**Settings**
- Light / Dark / System theme
- 11 languages: English, Tieng Viet, Espanol, Francais, Zhongwen, Nihongo, Hangugeo, Deutsch, Portugues, Hindi, Arabic
- Per-feature toggles (vibrate, beep, history, image storage, auto-copy, auto-open URL)

## Tech Stack

- **Flutter** 3.41+ / Dart 3.11+
- **Riverpod** for state management
- **Drift** (SQLite) for local database
- **mobile_scanner** for camera scanning
- **go_router** for navigation
- **Material 3** design system

## Getting Started

```bash
# Install dependencies
flutter pub get

# Generate code (database, localization, freezed models)
flutter pub run build_runner build --delete-conflicting-outputs
flutter gen-l10n

# Run in debug mode
flutter run

# Build release APK
flutter build apk --release

# Build release AAB (for Google Play)
flutter build appbundle --release
```

## Project Structure

```
lib/
  app/            # App widget, router, theme
  core/           # Database, constants, utilities, storage
  features/
    scan/         # Camera scanning, bulk scan
    generate/     # QR & barcode generation
    history/      # Scan history list & search
    favorites/    # Bookmarked results
    result/       # Scan/generate result detail
    settings/     # App settings & preferences
  shared/         # Enums, models, parsers, l10n, widgets
```

## Privacy

This app processes all data locally on your device. No personal data is collected or transmitted. See [Privacy Policy](html/privacy-policy.html).

## License

Copyright 2026 izmaze. All rights reserved.
