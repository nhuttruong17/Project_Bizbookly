# BizBookly Project

This repository contains the source code for the BizBookly project, which includes a Flutter-based mobile POS application and a suite of automated end-to-end tests using Robot Framework and Appium.

## Project Overview

- **BizBookly Mobile App**: A point-of-sale (POS) and business management application built with Flutter. It is designed for both Android and iOS platforms.
- **Automated Tests**: A suite of BDD-style end-to-end tests to validate the functionality of the mobile application on both Android and iOS.

## Folder Structure

Here is a high-level overview of the key directories in this project:

```
├── mobile.pos/         # Flutter mobile application source code.
├── Tests/              # Robot Framework test cases (BDD-style).
├── Resources/          # Robot Framework resources (Page Objects, Locators).
├── TestData/           # Test data for Robot Framework tests.
├── TestKeyWords/       # Custom keywords for Robot Framework.
└── ...
```

---

## 📱 Flutter Mobile App (`mobile.pos`)

This directory contains the Flutter application for BizBookly.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- An emulator or physical device running Android or iOS.

### How to Run the App

1.  **Navigate to the app directory:**
    ```bash
    cd mobile.pos
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the application:**
    The project is set up with multiple flavors (dev, staging, prod). To run a specific flavor, use the following commands:

    -   **Development:**
        ```bash
        flutter run --flavor dev -t lib/main_dev.dart
        ```
    -   **Staging:**
        ```bash
        flutter run --flavor staging -t lib/main_staging.dart
        ```
    -   **Production:**
        ```bash
        flutter run --flavor prod -t lib/main_prod.dart
        ```

---

## 🤖 Robot Framework E2E Tests

This project uses Robot Framework with Appium to automate end-to-end tests for the mobile application.

### Prerequisites

- [Python](https://www.python.org/downloads/)
- [Robot Framework](https://robotframework.org/#installation)
- [Appium](https://appium.io/docs/en/2.0/intro/)
- [Appium-Python-Client](https://pypi.org/project/Appium-Python-Client/)
- Appium Server running.
- An Android or iOS emulator/device connected and configured with Appium.

### Test Structure

-   **Test Cases**: Located in the `Tests/` directory, written in BDD (Given-When-Then) style.
-   **Page Objects**: Test resources are organized using the Page Object Model in `Resources/PageObject/`.
-   **Test Data**: Test data is stored in the `TestData/` directory.
-   **Custom Keywords**: Reusable keywords are defined in `TestKeyWords/Common.robot`.

### How to Run Tests

The tests are designed to be run against a running Appium server connected to a device.

1.  **Start the Appium Server** in a separate terminal.

2.  **Update Device Configuration (if necessary)**:
    The device UDIDs and application details are hardcoded in `TestData/Browser/Global.robot`. You may need to update these values to match your test environment.

    -   **Android (`UDID_Android`)**: `192.168.31.172:33877`
    -   **iOS (`UDID_iPad_Huy`, `UDID_iPad_Danh`)**
    -   **App Package (`APP_PACKAGE`)**: `com.bizbookly.manager.dev`
    -   **App Activity (`APP_ACTIVITY`)**: `com.bizbookly.manager.MainActivity`

3.  **Execute the Robot tests:**
    To run a specific test suite, use the `robot` command. For example, to run the Android login tests:

    ```bash
    robot Tests/Authen/LoginAndroid_BDD.robot
    ```

    You can also run all tests by pointing to the `Tests/` directory:
    ```bash
    robot Tests/
    ```
