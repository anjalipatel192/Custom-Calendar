# Custom Calendar (2025)

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Clean Architecture](https://img.shields.io/badge/Architecture-Clean%20Architecture-teal.svg?style=for-the-badge)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
[![State Management](https://img.shields.io/badge/State%20Management-flutter__bloc-blueviolet.svg?style=for-the-badge)](https://bloclibrary.dev)
[![Tests](https://img.shields.io/badge/Unit%20Tests-16%20Passed-success.svg?style=for-the-badge)]()
[![License](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](LICENSE)

> A modular, high-performance Flutter calendar application engineered with **Clean Architecture**, **BLoC** reactive state management, **Injectable + GetIt** dependency injection, and **AutoRoute** declarative routing.

---

## 📖 Project Overview

**Custom Calendar** provides an intuitive, responsive calendar interface built from decoupled layers. It loads year-round calendar data via decoupled data sources, groups and sorts month and day metrics asynchronously, and provides smooth page-swipe animations, interactive day-tile selections, and weekend accenting.

The codebase adheres strictly to the **Single Responsibility Principle (SRP)**, **Dependency Inversion Principle (DIP)**, and Flutter pre-publication security standards.

---

## 🛠 Tech Stack & Dependencies

| Category | Technology / Library | Version | Responsibility |
| :--- | :--- | :--- | :--- |
| **Language** | **Dart** | `^3.8.1` | Sound null-safe core programming language |
| **Framework** | **Flutter** | `>=3.22.0` | Cross-platform UI toolkit (Web, iOS, Android, macOS, Windows) |
| **State Management** | [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) | `^9.1.1` | Predictable, event-driven reactive state management |
| **Code Generation** | [`freezed`](https://pub.dev/packages/freezed) | `^3.1.0` | Immutable unions, copyWith, and value equality for events & states |
| **Dependency Injection** | [`injectable`](https://pub.dev/packages/injectable) & [`get_it`](https://pub.dev/packages/get_it) | `^2.5.1` / `^8.2.0` | Compile-time dependency resolution and service location |
| **Navigation & Routing**| [`auto_route`](https://pub.dev/packages/auto_route) | `^10.1.0+1` | Strongly-typed, declarative routing and deep-linking |
| **Testing** | `flutter_test` | SDK | Automated unit testing for domain entities, models, and BLoC |
| **Design System** | Material 3 / Cupertino | Native | Cohesive, accessible design tokens and responsive typography |

---

## 🏛 Clean Architecture & Structure

The codebase is organized into four distinct architectural layers, ensuring loose coupling, high testability, and clear separation of concerns:

```
lib/
├── core/                              # Cross-cutting concerns
│   ├── constants/
│   │   └── app_constants.dart         # Weekdays, month names, animation durations
│   └── errors/
│       └── failures.dart              # Sealed/abstract failure & exception types
│
├── domain/                            # Enterprise business logic & contracts (Pure Dart)
│   ├── entities/
│   │   └── calendar_day.dart          # Pure immutable domain entity
│   ├── repositories/
│   │   └── calendar_repository.dart   # Abstract repository interface
│   └── model/
│       └── response.dart              # Data transfer model & backwards-compatible typedef
│
├── infrastructure/                    # Data sources & external world adaptations
│   ├── datasources/
│   │   └── calendar_local_data_source.dart # Asset bundle reader & JSON parser
│   └── repositories/
│       └── calendar_repository_impl.dart   # Concrete implementation of CalendarRepository
│
├── application/                       # Application business logic (BLoC)
│   └── calender/
│       ├── calender_bloc.dart         # Event handling & state emissions
│       ├── calender_bloc.freezed.dart # Generated Freezed state & event code
│       ├── calender_event.dart        # Distinct typed user interaction events
│       └── calender_state.dart        # Immutable state with pagination & status flags
│
├── presentation/                      # UI components & screens
│   ├── widgets/
│   │   ├── calendar_header.dart       # Month display & animated navigation buttons
│   │   ├── weekday_header.dart        # Mon-Sun column headers with weekend accents
│   │   ├── calendar_grid.dart         # 7-column month grid with leading weekday offset
│   │   ├── calendar_day_tile.dart     # Interactive daily cell with selection feedback
│   │   └── selected_day_card.dart     # Summary card displaying selected date metadata
│   └── calender_view.dart             # Main screen with PageController lifecycle & AutoRoute
│
├── app_router.dart                    # AutoRoute routing configuration
├── app_router.gr.dart                 # AutoRoute generated routes
├── app_widget.dart                    # MaterialApp.router with Material 3 design system
├── injection.dart                     # Service locator registration setup
├── injection.config.dart              # Injectable compile-time generated registry
├── main.dart                          # App bootstrapping & initialization
└── restart_app.dart                   # Root subtree restart utility
```

### Architectural Flow:
```
[ Presentation (UI) ] ──(Events)──> [ CalenderBloc ] ──> [ CalendarRepository (Domain) ]
         ▲                                   │                         ▲
         │                                   ▼                         │
   (State Rebuild) <─────────────── [ CalenderState ]         [ CalendarRepositoryImpl (Infra) ]
                                                                       │
                                                                       ▼
                                                             [ LocalDataSource (Assets) ]
```

---

## ✨ Key Features

- 📅 **12-Month Continuous Navigation**: Fluid page-view pagination across all months of 2025 with boundary protection.
- 📐 **Dynamic Weekday Alignment**: Automatically offsets the first day of each month against its actual day of the week (Monday through Sunday).
- 🎨 **Material 3 Design System**: Custom Indigo/Slate palette with clean typography, soft card elevations, and rounded containers.
- 🔴 **Weekend Distinction**: Clear visual badges and typographic accents distinguishing Saturdays and Sundays.
- 🎯 **Interactive Day Selection**: Tap any day to highlight the cell and view a detailed breakdown card at the bottom.
- 💉 **Automated Dependency Injection**: Fully decoupled dependencies managed via Injectable and GetIt annotations.
- 🛡 **Robust Error Handling**: Graceful loading skeletons, empty state fallbacks, and a failure screen with a one-tap retry button.
- 🧪 **Unit Test Coverage**: Comprehensive automated tests verifying entity calculations, JSON serialization, data source error handling, and BLoC state transitions.

---

## 🚀 Setup & Run Instructions

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (`>= 3.22.0`)
- [Dart SDK](https://dart.dev/get-dart) (`>= 3.8.1`)
- An IDE (VS Code, Android Studio) or command line

### 1. Clone the Repository
```bash
git clone https://github.com/anjalipatel192/Custom-Calendar.git
cd Custom-Calendar
```

### 2. Configure Environment Template
Copy the `.env.example` file to create a local `.env` configuration:
```bash
cp .env.example .env
```
*(Note: `.env` is safely gitignored to prevent credential leaks).*

### 3. Install Dependencies
```bash
flutter pub get
```

### 4. Code Generation (Injectable, Freezed, AutoRoute)
To regenerate DI, Freezed states, and route configurations:
```bash
dart run build_runner build --delete-conflicting-outputs
```

### 5. Run the Application
- **Run on Web (Chrome)**:
  ```bash
  flutter run -d chrome
  ```
- **Run on macOS Desktop**:
  ```bash
  flutter run -d macos
  ```
- **Run on Mobile (Android / iOS)**:
  ```bash
  flutter run
  ```

### 6. Run Automated Tests
```bash
flutter test
```

### 7. Run Code Quality & Lint Checks
```bash
flutter analyze
```

---

## 🔒 Security & Repository Hygiene

This repository follows strict pre-publication sanitization standards:
- **Zero Raw Secrets**: No API credentials, OAuth tokens, keystores, or private URLs are committed.
- **Environment Isolation**: `.env` and `.env.*` variants are excluded via `.gitignore`.
- **Platform Keystore Safeguards**: Android keystores (`*.jks`, `*.keystore`, `key.properties`) and Apple certificates (`*.p12`, `*.pem`) are excluded.
- **Operating System & IDE Artifacts**: `.DS_Store`, `.idea/`, `*.iml`, and `.vscode/` caches are ignored.

---

## 📄 License
This project is open-source and available under the [MIT License](LICENSE).
