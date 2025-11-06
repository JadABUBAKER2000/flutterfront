# 📱 UniBook — User Module

This project is part of the UniBook application. 
The scope of this module focuses on user authentication and profile management.

## ✅ Features
- Sign Up
- Login
- Local Data Storage (SharedPreferences)
- Password Encryption (SHA-256)
- Dual Language UI (Arabic + English)
- Profile Page
- Logout

## 🏗️ Project Structure
```
/lib
 ├── main.dart
 ├── models/
 │    └── user_model.dart
 ├── services/
 │    └── local_db_service.dart
 └── screens/
      ├── auth/
      │    ├── sign_in.dart
      │    └── sign_up.dart
      └── profile/
           └── profile_screen.dart
```

## 🔐 Data Storage
User data is stored locally using **SharedPreferences**:
- name
- email
- encrypted password

Passwords are encrypted using **SHA-256 hash** before saving.

> ✅ No plain passwords are stored.

## 🖼️ Screens
- Sign In Screen
- Sign Up Screen
- Profile Screen

## ▶️ How to run
1. Install Flutter
2. Run:
```
flutter pub get
flutter run
```

## 🔧 Tech Stack
- Flutter
- Dart
- SharedPreferences
- Crypto (SHA-256)

## 🔮 Future Enhancements
- Connect to Firebase
- Multi-user support
- Add orders & products

## 👤 Developer
**Jad Abubaker**
(Responsible for Authentication Module)