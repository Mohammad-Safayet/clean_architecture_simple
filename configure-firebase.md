# Configuring Firebase

### Step 1: Install the required command line tools

If you haven't already, [install the Firebase CLI](https://firebase.google.com/docs/cli#setup_update_cli).

Log into Firebase using your Google account by running the following command:

```bash
firebase login
```

Install the FlutterFire CLI by running the following command from any directory:

```bash
dart pub global activate flutterfire_cli
```


### Step 2: Create Firebase Project

Go to firebase console and create three different projects, one for each flavors.


### Step 3:  Configure to use Firebase

Use he FlutterFire CLI to set up connectivity between your Flutter apps and Firebase.

Run the following command within your Flutter project directory to initiate the app configuration workflow:

```bash
flutterfire config --project=your-project --out=lib/src/core/config/firebase/firebase_options_dev.dart --ios-bundle-id=com.example.chuck-norris.dev --android-package-name=com.example.chuck_norris.dev --platform=android,ios
```

This will generate a `google-services.json` file, as illustrated in the image below:

![google-services.json file](https://i.imgur.com/mzkm8s8.png)

However, for proper functionality, we will manually add the file to the project. First, delete the existing file, and then download and copy the files for development, staging, and production, as demonstrated in the images below:

![google-services.json file](https://i.imgur.com/IF6vgSD.png)
![google-services.json file](https://i.imgur.com/7VLtmSt.png)
![google-services.json file](https://i.imgur.com/RFGWaO3.png)

For iOS [check this](https://stackoverflow.com/a/48789232/5372178).

Perform the step for both production and staging flavors by altering the project name and the output file name accordingly.

**For more information check out the [official documentation](https://firebase.google.com/docs/flutter/setup?platform=android)**.
