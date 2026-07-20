# Coding Standards

---

# Ustad AI Kids

### Software Development Standards

---

**Project:** Ustad AI Kids

**Document:** Coding Standards

**Document ID:** CS-001

**Version:** 1.0

**Status:** Draft

**Author:** Saba Zafar

**Technical Architect:** OpenAI ChatGPT

**Date:** July 2026

---

# Purpose

This document defines the coding standards and best practices for the Ustad AI Kids project.

The goals are:

- Readable code
- Maintainable code
- Consistent architecture
- Easier onboarding
- Reliable testing
- Scalable development

---

# Core Principles

1. Write code for humans first.
2. Keep functions small and focused.
3. Prefer clarity over cleverness.
4. Avoid duplication (DRY).
5. Follow Clean Architecture.
6. Keep business logic out of UI.
7. Every feature should be independently testable.

---

# Project Architecture

The application follows:

- Clean Architecture
- Feature-First Structure
- Repository Pattern
- Riverpod State Management
- Firebase Backend
- Service Layer for AI

---

# Naming Conventions

## Folders

Use:

snake_case

Example

```
ai_teacher
lesson_player
parent_dashboard
```

---

## Files

Use:

snake_case.dart

Example

```
lesson_page.dart
lesson_card.dart
progress_provider.dart
```

---

## Classes

Use:

PascalCase

Example

```
LessonPage
LessonRepository
SpeechService
```

---

## Variables

Use:

camelCase

Example

```dart
lessonProgress
currentChild
quizScore
```

---

## Constants

Use:

camelCase with const

```dart
const maxLessonDuration = 20;
const apiTimeout = Duration(seconds: 30);
```

---

## Private Members

Prefix with underscore.

```dart
_finalScore
_loadLesson()
```

---

# File Organization

Every Dart file should follow this order:

```dart
Imports

Constants

Enums

Models

Classes

Private Helpers
```

---

# Import Order

1. Flutter packages
2. Third-party packages
3. Project packages
4. Relative imports

Example

```dart
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ustad_ai_kids/core/constants.dart';

import '../widgets/lesson_card.dart';
```

---

# Widget Guidelines

Prefer StatelessWidget whenever possible.

Only use StatefulWidget when local mutable state is required.

Extract reusable widgets.

Keep build() methods short.

Target:

Less than 150 lines.

---

# Business Logic

Business logic belongs inside:

Use Cases

Repositories

Services

Never inside UI widgets.

---

# State Management

Use Riverpod.

Rules:

- One provider per responsibility.
- Keep providers small.
- Avoid global mutable state.
- Dispose resources correctly.

---

# Error Handling

Never ignore exceptions.

Use custom exception classes.

Show user-friendly messages.

Log technical details.

Example

```dart
try {

} catch (e) {

}
```

---

# Logging

Use structured logging.

Development:

Verbose

Production:

Warnings

Errors

Avoid print() in production.

---

# Asynchronous Code

Always use:

async/await

Avoid deeply nested callbacks.

Handle loading states.

Handle timeout errors.

---

# API Calls

Never call APIs directly from UI.

Flow:

UI

↓

Provider

↓

Repository

↓

Service

↓

API

---

# Firebase Rules

UI must never directly access Firestore.

Always use repositories.

Authentication handled through AuthService.

---

# AI Integration

All AI requests pass through:

AIService

PromptBuilder

MemoryService

ContextManager

No screen communicates directly with OpenAI.

---

# Voice Engine

Speech Recognition

↓

Intent Processing

↓

AI Response

↓

Speech Output

All voice operations use VoiceManager.

---

# Comments

Comment only when necessary.

Avoid obvious comments.

Prefer self-documenting code.

---

# Documentation

Public classes require documentation.

Example

```dart
/// Loads today's lesson for the selected child.
```

---

# Code Formatting

Use:

dart format

Maximum line length:

100 characters

---

# Linting

Enable:

flutter_lints

Treat warnings seriously.

Fix all analyzer issues before merging.

---

# Git Workflow

Branches

```
main

develop

feature/*

bugfix/*

release/*
```

---

# Commit Messages

Format

```
type(scope): description
```

Examples

```
feat(ai): add lesson generator

fix(auth): resolve login issue

docs(curriculum): update level 2 roadmap

refactor(voice): simplify speech manager

test(quiz): add quiz engine tests
```

---

# Pull Requests

Every PR should include:

Purpose

Screenshots (if UI)

Testing performed

Related issue

Checklist

---

# Code Reviews

Review for:

Correctness

Readability

Performance

Security

Accessibility

Architecture

Testing

---

# Testing Standards

Every feature should include:

Unit Tests

Widget Tests

Integration Tests

Critical AI workflows should have regression tests.

---

# Performance

Avoid unnecessary rebuilds.

Lazy-load large assets.

Cache lesson data.

Optimize AI requests.

---

# Security

Never commit:

API Keys

Secrets

Passwords

Certificates

Use environment variables and secure storage.

---

# Accessibility

Support:

Screen Readers

Large Text

High Contrast

Voice Navigation

Touch Targets ≥ 48dp

---

# Definition of Done

A feature is complete when:

- Code compiles
- Tests pass
- Documentation updated
- Linting passes
- Code reviewed
- UI verified
- Accessibility checked
- No critical bugs remain

---

# Future Standards

As the project grows, additional standards may be added for:

- AI prompt quality
- Curriculum versioning
- Localization
- Analytics events
- Performance budgets

---

# Approval

Approved for Firebase Setup

Next Document

18_FIREBASE_SETUP.md
