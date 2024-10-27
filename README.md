# Task Manager Application

Task Manager is a Flutter application that allows users to add, complete, and delete tasks, providing a simple and efficient task management solution.

## Table of Contents

-   [Getting Started](#getting-started)
-   [Project Structure](#project-structure)
-   [Running the Application](#running-the-application)
-   [Testing](#testing)
    -   [Unit Testing](#unit-testing)
    -   [Integration Testing](#integration-testing)
-   [Continuous Integration (CI/CD)](#continuous-integration-cicd)
-   [Contribution](#contribution)

## Getting Started

### Prerequisites

Ensure you have the following installed:

-   [Flutter SDK](https://flutter.dev/docs/get-started/install)
-   [Dart](https://dart.dev/get-dart)

To check if Flutter is installed correctly, run:

```bash
flutter doctor
```

### Clone the Repository

```bash
git clone https://github.com/cuonglamphu/TDD_Flutter_Practice.git
cd task_manager
```

### Install Dependencies

Install the required dependencies by running:

```bash
flutter pub get
```

## Project Structure

-   `lib/`: Contains the main application code.
    -   `main.dart`: Entry point of the app.
    -   `screens/`: Contains the Task screen where tasks are added, completed, or deleted.
    -   `models/`: Contains the Task model.
-   `integration_test/`: Contains integration tests.
-   `test/`: Contains unit tests and widget tests.

## Running the Application

To run the application on a connected device or emulator, use:

```bash
flutter run
```

## Testing

This project uses both unit tests and integration tests to ensure functionality.

### Unit Testing

Run all unit tests with:

```bash
flutter test
```

Unit tests are located in the `test/` directory. These tests cover individual widgets and components.

### Integration Testing

Integration tests are located in the `integration_test/` directory. They simulate end-to-end user interactions and verify that the application workflows operate as expected.

To run integration tests, use:

```bash
flutter test integration_test/task_manager_integration_test.dart
```

> **Note**: This command will run both unit and integration tests if run on CI/CD or local testing environments without a GUI requirement.

## Continuous Integration (CI/CD)

GitHub Actions is used to automatically run tests on every push and pull request to the main branch.

### CI/CD Workflow Setup

The CI/CD workflow file is located at `.github/workflows/flutter_ci.yml`. It performs the following steps:

1. Checks out the repository.
2. Sets up Flutter.
3. Installs dependencies.
4. Runs all unit and integration tests using `flutter test`.

For more details, refer to the configuration in `.github/workflows/flutter_ci.yml`.

## Contribution

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a pull request.

---

Feel free to report any issues or suggest features. Thank you for your interest in contributing to Task Manager!
