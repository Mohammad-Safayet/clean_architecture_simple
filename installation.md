# Installation

1. Clone the repository:

    ```bash
    mkdir chuck-norris
    cd chuck-norris
    git clone https://github.com/yourusername/your-flutter-project.git .
    ```
2. Install dependencies:
    ```bash
    flutter pub get
    ```
   
3. Generate App icons:
   ```bash
   dart run flutter_launcher_icons:main -f flutter_launcher_icons*
   ```
   For iOS some additional steps needs to be taken. Please refer to this [guide](https://medium.com/@keaindrak/flavoring-a-flutter-app-3df51fe86d7a). If facing other difficulties please refer to the [Official Guide](https://pub.dev/packages/flutter_launcher_icons).<br><br>

4. Generate Native Splash screen:
   ```bash
   dart run flutter_native_splash:create --flavors development,staging,production
   ```
   For iOS some additional steps needs to be taken. Please refer to the [Official guide](https://pub.dev/packages/flutter_native_splash#ios-setup).<br><br>

5. Add Firebase:

   In order to connect to Firebase [check here](configure-firebase.md).

### Run the App
Run the app on an emulator or a connected device:

```bash
flutter run -t lib/main/main_dev.dart --flavor development
```

The app will launch on your device/emulator.
