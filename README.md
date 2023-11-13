<div style="display: flex; justify-content: center;">
    ![App Icon](assets/images/chucknorris_logo_coloured_small.png)
</div>

# Chuck Norris Jokes App

## Overview

The **Chuck Norris Jokes App** is a fun and entertaining mobile application that brings you Chuck Norris jokes at your fingertips. Chuck Norris jokes are legendary for their humor and exaggeration of Chuck Norris's toughness and superhuman abilities.


## Features

- **Endless Laughter:** Explore an extensive collection of Chuck Norris jokes that will keep you laughing for hours.
- **Random Jokes:** Receive a random Chuck Norris joke every time you open the app for a surprise dose of humor.
- **Category Jokes:** Receive a Chuck Norris joke on a certain category upon selected a certain category.
- **Reload New Jokes:** Reload a new Chuck Norris joke on a certain category upon selected a certain category or a random if not selected any category.
- **Simple and Lightweight:** The app is designed to be user-friendly and lightweight, ensuring a seamless and enjoyable experience.

## Getting Started

These instructions will help you set up and run the Flutter project on your local machine.

### Prerequisites

1. #### Development Machine:
    Make sure you have [Flutter](https://flutter.dev/docs/get-started/install) and [Dart](https://dart.dev/get-dart) installed on your development machine.

2. #### Preparing Android Environment:
   
   

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/your-flutter-project.git
    cd your-flutter-project
    ```

2. Install dependencies:

    ```bash
    flutter pub get
    ```

### Run the App

3. Run the app on an emulator or a connected device:

    ```bash
    flutter run
    ```

   The app will launch on your device/emulator.

## Screenshots
<img src="https://raw.githubusercontent.com/Mohammad-Safayet/clean_architecture_simple/main/screenshots/screenshot_1.png" alt="Application Screenshot 1" width="200" height="400">
<img src="https://raw.githubusercontent.com/Mohammad-Safayet/clean_architecture_simple/main/screenshots/screenshot_2.png" alt="Application Screenshot 2" width="200" height="400">
<img src="https://raw.githubusercontent.com/Mohammad-Safayet/clean_architecture_simple/main/screenshots/screenshot_2.png" alt="Application Screenshot 3" width="200" height="400">

## Contributing

Contributions to the Chuck Norris Jokes App are welcomed! If you have new jokes or feature ideas, feel free to contribute:

1. Fork the repository.
2. Add your jokes or implement new features.
3. Test your changes thoroughly.
4. Submit a pull request.

## Issues

If you encounter any issues, have suggestions, or want to share your favorite Chuck Norris jokes, please [open an issue](https://github.com/yourusername/chuck-norris-jokes-app/issues).

## License

This Chuck Norris Jokes App is licensed under the Chuck Norris License, which means Chuck Norris doesn't need a license. He simply allows you to use it.

## Acknowledgments

I want to give a shout-out to some amazing projects that have been a huge inspiration for this work:

- **[Chuck Norris API](https://api.chucknorris.io/):** A free JSON API for hand curated Chuck Norris facts.
- **[Assets Images](https://github.com/chucknorris-io/chuck-api/tree/master/src/main/resources/static/img):** Chuck Norris API GitHub repository.


Enjoy the jokes and remember, Chuck Norris counted to infinity. Twice!

flutterfire config --project=chucknorris-jokes-dev --out=lib/src/core/config/firebase/firebase_options_dev.dart --ios-bundle-id=com.example.chuck-norris.dev --macos-bundle-id=com.example.chuck-norris.dev --android-package-name=com.example.chuck_norris.dev
flutterfire config --project=chucknorris-jokes-stage --out=lib/src/core/config/firebase/firebase_options_stage.dart --ios-bundle-id=com.example.chuck-norris.stag --macos-bundle-id=com.example.chuck-norris.stag --android-package-name=com.example.chuck_norris.stag
flutterfire config --project=chucknorris-jokes-fc310 --out=lib/src/core/config/firebase/firebase_options.dart --ios-bundle-id=com.example.chuck-norris --macos-bundle-id=com.example.chuck-norris --android-package-name=com.example.chuck_norris