# How to configure and run this project?

## For Android Studio:

**Step 1:** To begin, click on "Edit Configurations" as shown in Image 1:

![Step 1](https://i.imgur.com/QDGLZdp.png)

**Step 2:** Select "Flutter" from the configuration list, and choose the Dart entrypoint path based on your flavor. Provide a name, then click "Apply" and "OK" afterward. Refer to Images 2, 3, and 4 for visual guidance:

![Select Flutter configuration option](https://i.imgur.com/5J2QWpd.png)

![Set 'dev' as build](https://i.imgur.com/j9caPbn.png)

![Choose path to main_dev.dart](https://i.imgur.com/xboVmtD.png)

**Step 3:** Follow Step 1 and 2 to create a staging and production configuration:

![Prod configuration](https://i.imgur.com/FHxqHAG.png)

N.B: In this step you may need to setup your dart sdk path. If you get warned for
"dart sdk not found in specified location" then just click on "fix" and select your dart sdk path.

## For VS Code:

**Step 1:** Add launch.json file under .vscode

![VS Code Step 1](https://i.imgur.com/20rOqdU.png)

**Step 2:** Add the following code in the launch.json file:

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Launch Development",
            "request": "launch",
            "type": "dart",
            "program": "lib/main/main_dev.dart",
            "flutterMode": "debug",
            "args": [
                "--flavor", 
                "development", 
                "--target", 
                "lib/main/main_dev.dart"
            ]
        },
        {
            "name": "Launch Staging",
            "request": "launch",
            "type": "dart",
            "program": "lib/main/main_stage.dart",
            "args": [
                "--flavor", 
                "staging", 
                "--target", 
                "lib/main/main_stage.dart"
            ]
        },
        {
            "name": "Launch Production",
            "request": "launch",
            "type": "dart",
            "program": "lib/main/main_prod.dart",
            "flutterMode": "release",
            "args": [
                "--flavor", 
                "production", 
                "--target", 
                "lib/main/main_prod.dart"
            ]
        }
    ]
}
```

**Step 3:** The file will be automatically create the environment to run the project as show the images below:

![VS Code Step 3](https://i.imgur.com/EB5cgqu.png)

![VS Code Step 4](https://i.imgur.com/ewbHOsv.png)


# How to configure and make android release build for production
Release build can be made using `flutter build <options> apk` command. Before that create a **key.properties** file in the **android** folder. Add folloiwng lines to that file:
```
keyAlias=<your keystore alias>
password=<your keystore password>
storeFile=<path to the keystore file>
```
Then run `flutter build appbundle -t lib/main/main_prod.dart --flavor production` to generate app bundle (.aab) file. To generate .apk file, run `flutter build apk --split-per-abi -t lib/main/main_prod.dart --flavor production`.

For more details, please read through guide to build and release android app documentation from [this link](https://docs.flutter.dev/deployment/android).