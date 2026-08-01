# Ustad AI Kids Architecture

## Vision

Ustad AI Kids is an AI-powered personalized learning platform for children.

The application provides:

- Adaptive learning
- Subject-based lessons
- Interactive quizzes
- Gamification
- AI tutoring
- Parent dashboards
- Cloud synchronization

---

# Technology Stack

## Frontend

- Flutter
- Dart

## State Management

- Riverpod

## Routing

- GoRouter

## Local Storage

- SharedPreferences

## Backend (Future)

- Firebase Authentication
- Cloud Firestore
- Cloud Functions
- Firebase Storage

## AI Layer (Future)

- OpenAI
- Gemini

---

# Architectural Pattern

Feature First + Clean Architecture

```
lib/
├── app/
├── features/
├── shared/
└── core/
```

---

# Feature Structure

Each feature follows:

```
feature/
├── data/
│   ├── datasources/
│   └── repositories/
│
├── domain/
│   └── models/
│
└── presentation/
    ├── pages/
    ├── providers/
    └── widgets/
```

---

# Dependency Flow

Allowed:

Presentation
→ Provider
→ Repository
→ Datasource

Not Allowed:

Datasource
→ UI

Repository
→ Widget

Widget
→ Storage

---

# State Management Rules

Riverpod is the only state management solution.

Use:

- Provider
- StateNotifierProvider

Do not introduce:

- Provider package
- GetX
- Bloc
- MobX

without architecture approval.

---

# Navigation Rules

Use GoRouter.

All routes must be declared in:

lib/app/router.dart

Do not use:

MaterialApp routes

named Navigator routes

for primary navigation.

---

# Storage Rules

Current:

SharedPreferences

Future:

Firestore

Storage access must always go through repositories.

Never access SharedPreferences directly from UI.

---

# Current Features

Implemented:

- Splash
- Welcome
- Login
- Register
- Child Profile
- Dashboard
- Lessons
- Quiz
- Progress Tracking

Planned:

- Daily Challenges
- Achievements
- Parent Dashboard
- AI Tutor
- Notifications
- Cloud Sync

---

# Design Principles

1. Keep widgets small.
2. Keep pages clean.
3. Business logic belongs in providers.
4. Storage belongs in repositories.
5. UI should never know storage details.
6. Prefer composition over inheritance.

---

# AI Agent Rules

Agents may:

- Create widgets
- Create providers
- Create repositories

Agents may NOT:

- Change architecture
- Rename folders
- Replace Riverpod
- Replace GoRouter
- Modify unrelated features

without explicit approval.

---

# Version

Architecture Version: 1.0

Last Updated: 2026
