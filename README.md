# Food Ninja

**Food Ninja** is a Flutter-based mobile application designed to deliver healthy food quickly and efficiently. Built with a scalable, clean architecture, this project highlights our expertise in modern mobile development, focusing on creating a robust, secure, and user-friendly experience.

## Demo
Click on the image to watch the demo on youtube

[![Demo](https://img.youtube.com/vi/D4cKA_oMhVs/maxresdefault.jpg)](https://youtu.be/D4cKA_oMhVs)

## Technical Overview

The app is structured for maintainability and scalability, following clean architecture principles. Key features include:

- **Separation of Concerns**: The project is organized into well-defined layers (`core`, `features`, `di`) to keep domain logic, presentation, and utilities separate. This enhances maintainability and scalability.
- **BLoC State Management**: We utilized BLoC to manage app state in a structured and predictable way, facilitating easier debugging and testing.
- **Dependency Injection**: Using `GetIt` for dependency injection enables modularity and makes unit testing straightforward by allowing dependencies to be easily swapped.
- **Advanced Routing with GoRouter**: This application includes sophisticated routing for a seamless user experience, handled by `GoRouter`.

## Folder Structure

Here’s an overview of the folder structure:

```plaintext
lib/
├── core/                      # Core modules and shared resources
│   ├── main/                  # Main application files
│   ├── navigation/            # Navigation configuration and routes
│   ├── theme/                 # Theme and styling configurations
│   ├── util/                  # Utility classes and helper functions
│   └── widgets/               # Reusable widgets used across the app
├── di/                        # Dependency injection setup
├── features/                  # Features divided by functionality
│   └── feature_name/          # Feature folder
│       ├── data/              # Data layer for managing models and services
│       │   ├── models/        # Data models for the home feature
│       │   └── services/      # Services handling data operations
│       └── presentation/      # Presentation layer (UI and state)
│           ├── cubit/         # State management using Cubit/BLoC
│           ├── widgets/       # Feature-specific widgets
│           └── screen.dart    # Screen implementation
```

## Key Technologies
This project incorporates several advanced technologies:
* Firebase: We use Firebase Firestore, Firebase Storage, and Firebase Authentication to handle user data, images, and secure user authentication.
* Google Sign-In: Allows for quick and secure login via Google accounts.
* Paymob Payment Gateway: Supports secure payment transactions, which is essential for any e-commerce or delivery app.
* GetIt for Dependency Injection: Ensures loosely coupled code and improves testability.
* Bloc/Cubit for State Management: Simplifies state management, providing predictable states across screens and features.

## Team Credits
* [Mohannad El-Sayeh](https://github.com/mSaayeh)
* [Nadin Ahmed](https://github.com/NadinAhmed)
* [Muhammad Issa](https://github.com/mu7ammad-3issa)
