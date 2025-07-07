# NotesApp

## App Architecture

+---------------------+           +------------------------+
| Login/SignUp Screen |  ----->   |   Firebase Auth        |
+---------------------+           +------------------------+
         |                               |
         v                               v
+---------------------+           +------------------------+
|  Notes List Screen  |  <----->  |   Firestore Database   |
+---------------------+           +------------------------+
         |
         v
+---------------------+
|Add/Edit/Delete Note |
+---------------------+
         |
         v
+---------------------+
|       Log Out       |
+---------------------+
+---------------------+           +------------------------+
|    Login Screen     |  ----->   |   Firebase Auth        |
+---------------------+           +------------------------+
         |                               |
         v                               v
+---------------------+           +------------------------+
|  Notes List Screen  |  <----->  |   Firestore Database   |
+---------------------+           +------------------------+
         |
         v
+---------------------+
|   Add/Edit Note     |
+---------------------+

## Build Instructions

### 1. Prerequisites

- Flutter SDK installed ([Install Guide](https://docs.flutter.dev/get-started/install))
- A Firebase project created ([Firebase Console](https://console.firebase.google.com/))

### 2. Clone the repository
```bash
git clone https://github.com/LaurelleJinelle/notes_app_mobile-dev
cd NotesApp
```
### 3. Install Flutter dependencies
```
flutter pub get
```
### 4. Firebase Setup for Flutter
Add Firebase to your Flutter app:
Follow the FlutterFire documentation for platform setup:
https://firebase.flutter.dev/docs/overview/

⚠️ This app uses:
  - firebase_core
  - firebase_auth
  - cloud_firestore
### 5. Enable Email/Password Authentication of Firebase
### 6. Configure Firestire Database
### 7. Run the app
```
flutter run
```
