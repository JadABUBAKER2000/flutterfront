# UniBook - Authentication (Local) - Prepared for jad abubaker

This package contains the Flutter project files for the **Authentication & Profile** portion
(person 1) of the UniBook limited shop project. Data is stored locally using sqlite (sqflite).
Passwords are hashed with SHA-256 prior to storing.

## How to use
1. Open this folder in your Flutter environment (Android Studio / VSCode).
2. Run `flutter pub get`.
3. Run on device/emulator: `flutter run`.

## Notes
- Language: bilingual labels included (English / Arabic).
- Password hashing uses `crypto` package (SHA-256).
- Session is stored in local sqlite `session` table for simple persistence.
- Replace `assets/images/logo.png` with your real logo before presenting.
- Before handing over, update README with your team names and notes.

Delivered to: jad abubaker
