# Folder Structure

---

# Ustad AI Kids

### Flutter Project Organization

---

**Project:** Ustad AI Kids

**Document:** Folder Structure

**Document ID:** FS-001

**Version:** 1.0

**Status:** Draft

**Author:** Saba Zafar

**Technical Architect:** OpenAI ChatGPT

**Date:** July 2026

---

# Purpose

This document defines the folder organization for the Flutter application, backend, assets, and supporting resources.

The goals are:

- Scalability
- Maintainability
- Testability
- Clear separation of concerns
- Easy onboarding for contributors

---

# Architecture

The project follows:

- Clean Architecture
- Feature-First Organization
- Repository Pattern
- Riverpod State Management

---

# Root Project Structure

```
UstadAIKids/

docs/
flutter_app/
backend/
assets/
design/
research/
scripts/
.github/
README.md
LICENSE
.gitignore
```

---

# Flutter Application

```
flutter_app/

android/
ios/
web/
macos/
linux/
windows/
test/

lib/

pubspec.yaml
```

---

# lib/

```
lib/

main.dart

app/

core/

shared/

features/

services/

routes/

l10n/
```

---

# app/

Application configuration.

```
app/

app.dart

theme.dart

router.dart

constants.dart

environment.dart
```

Responsibilities

- Application startup
- Themes
- Routing
- Global configuration

---

# core/

Reusable application infrastructure.

```
core/

config/

errors/

exceptions/

network/

storage/

utils/

extensions/

security/
```

Contains code shared across all features.

---

# shared/

Reusable UI components.

```
shared/

widgets/

dialogs/

buttons/

cards/

animations/

icons/

forms/

loaders/
```

Examples

PrimaryButton

LoadingIndicator

CustomCard

AvatarWidget

---

# services/

Global services.

```
services/

ai/

speech/

firebase/

notifications/

analytics/

authentication/
```

These services are not tied to one feature.

---

# routes/

```
routes/

app_router.dart

route_names.dart

guards.dart
```

Responsible for navigation.

---

# l10n/

Localization files.

```
l10n/

en.arb

ur.arb

ja.arb
```

Future languages can be added without modifying application logic.

---

# Features

Every feature has the same internal architecture.

```
features/

authentication/

parent/

child/

lesson/

coding/

quiz/

ai_teacher/

voice/

progress/

rewards/

settings/
```

---

# Feature Layout

Example

```
lesson/

data/

domain/

presentation/
```

---

## data/

Responsible for data retrieval.

```
data/

models/

repositories/

datasources/
```

Contains

- Firestore
- API calls
- Local storage

---

## domain/

Business logic.

```
domain/

entities/

repositories/

usecases/
```

Contains

- Lesson entity
- StartLesson use case
- CompleteLesson use case

---

## presentation/

UI.

```
presentation/

pages/

widgets/

providers/
```

Contains

- Screens
- Widgets
- Riverpod providers

---

# AI Service

```
services/ai/

openai_service.dart

lesson_generator.dart

prompt_builder.dart

memory_service.dart

context_manager.dart
```

Responsibilities

- Prompt creation
- AI requests
- Lesson generation
- Context handling

---

# Speech Service

```
services/speech/

speech_to_text_service.dart

text_to_speech_service.dart

voice_manager.dart
```

---

# Firebase

```
services/firebase/

auth_service.dart

firestore_service.dart

storage_service.dart

analytics_service.dart
```

---

# Assets

```
assets/

images/

icons/

avatars/

animations/

audio/

videos/

fonts/

illustrations/

curriculum/
```

---

# Images

```
images/

logo/

backgrounds/

lesson_images/

badges/
```

---

# Audio

```
audio/

effects/

music/

voice_prompts/
```

---

# Curriculum

```
curriculum/

stories/

lessons/

quizzes/

projects/
```

Initially these files can be stored as JSON or Markdown and later migrated to Firestore.

---

# Backend

```
backend/

cloud_functions/

api/

scripts/

firebase/

```

---

# Scripts

```
scripts/

setup.sh

build.sh

deploy.sh

backup.sh

```

---

# Design

```
design/

wireframes/

mockups/

logos/

branding/

figma_exports/
```

---

# Research

```
research/

competitors/

papers/

curriculum/

ai/

voice/

```

---

# Tests

```
test/

unit/

widget/

integration/

golden/

```

---

# Naming Convention

Folders

snake_case

Example

```
ai_teacher/
```

Files

snake_case

Example

```
lesson_page.dart
```

Classes

PascalCase

```
LessonPage
```

Variables

camelCase

```
lessonProgress
```

Constants

camelCase

```
maxLessonDuration
```

---

# Dependency Rule

Dependencies always point inward.

```
Presentation

↓

Domain

↓

Data

↓

Services
```

Presentation must never access Firestore directly.

All data flows through repositories.

---

# Version 1 Features

```
authentication

parent

child

lesson

coding

quiz

voice

ai_teacher

progress

rewards

settings
```

Future modules can be added without changing the existing architecture.

---

# Future Expansion

Planned feature folders:

```
teacher_portal/

school_dashboard/

robotics/

science/

mathematics/

english/

computer_vision/

offline_learning/

marketplace/

admin/
```

---

# Folder Structure Principles

1. One responsibility per folder.
2. Feature-first organization.
3. Shared code only in shared/ or core/.
4. Keep business logic out of UI.
5. Every feature is independently testable.
6. Avoid circular dependencies.
7. Design for long-term scalability.

---

# Approval

Approved for Coding Standards

Next Document

17_CODING_STANDARDS.md
