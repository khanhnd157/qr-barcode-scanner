# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Flutter mobile app (Android/iOS) for scanning and generating QR codes and barcodes. Package: `com.izmaze.qrcode.barcode.scanner.generator`. Requires Flutter 3.29.0+ and Dart 3.0.0+.

## Common Commands

```bash
flutter pub get                          # Install dependencies
flutter pub run build_runner build       # Generate code (Drift ORM, Riverpod, Freezed)
flutter pub run build_runner build --delete-conflicting-outputs  # Regenerate all
flutter test                             # Run all tests
flutter test test/unit/parsers/          # Run parser tests only
flutter test --name "test name"          # Run a single test by name
flutter analyze                          # Lint check
flutter run                              # Run on connected device
flutter build apk                        # Android release build
flutter build ios                        # iOS release build
```

Code generation must be run after modifying Drift tables/DAOs, Riverpod annotated providers, or Freezed models.

## Architecture

Clean architecture with feature-based modules under `lib/features/`. Each feature follows `domain/` → `application/` → `presentation/` layering.

```
lib/
├── app/            # MaterialApp, GoRouter, theme
├── bootstrap.dart  # App initialization (DB, providers)
├── core/           # Database (Drift ORM), permissions, storage, utils
├── features/       # Feature modules (scan, generate, history, favorites, settings, result)
└── shared/         # Cross-feature: enums, models, parsers, l10n, widgets
```

**State management:** Flutter Riverpod with code generation (`riverpod_annotation`). Uses `Provider`, `StateProvider`, `StateNotifierProvider`, and `StreamProvider` patterns.

**Navigation:** GoRouter with 5 stateful shell branches for bottom navigation (`/scan`, `/generate`, `/history`, `/favorites`, `/settings`). Dynamic routes for generate subtypes.

**Database:** Drift ORM with SQLite. Two tables: `ScanRecords` (scan/generate history) and `AppSettingsTable` (user preferences). DAOs in `lib/core/database/daos/`.

**Content parsing:** 9 specialized parsers in `lib/shared/parsers/` handle different content types (URL, WiFi, vCard, geo, calendar, etc.) from scanned raw values. `ContentParser` dispatches to the appropriate parser.

**Key enums** in `lib/shared/enums/`: `CodeFormat` (14 barcode types), `CodeContent` (12 content types), `SourceType` (scanned vs generated).

## Localization

Two languages: English (`app_en.arb`) and Vietnamese (`app_vi.arb`) in `lib/shared/l10n/arb/`. Config in `l10n.yaml`.

## Linting

Uses `flutter_lints` with custom rules in `analysis_options.yaml`: prefer const constructors, avoid print, prefer single quotes.

## Testing

Tests use `flutter_test` + `mocktail` for mocking. Test files are in `test/unit/parsers/` covering content parsing and barcode validation logic.