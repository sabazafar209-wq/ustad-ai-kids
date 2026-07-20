# Database Design Document

---

# Ustad AI Kids

### AI-Powered Personalized Learning Platform

---

**Project:** Ustad AI Kids

**Document:** Database Design

**Document ID:** DBD-001

**Version:** 1.0

**Status:** Draft

**Author:** Saba Zafar

**Technical Architect:** OpenAI ChatGPT

**Date:** July 2026

---

# Revision History

| Version | Date | Description |
|----------|------|-------------|
|1.0|July 2026|Initial Firestore Database Design|

---

# Table of Contents

1. Overview
2. Database Technology
3. Collections
4. Parent Collection
5. Child Collection
6. Curriculum Collection
7. Lesson Collection
8. Quiz Collection
9. Progress Collection
10. Rewards Collection
11. Daily Learning Plan
12. AI Conversation History
13. Voice Sessions
14. App Settings
15. Analytics
16. Firestore Security Rules
17. Relationships
18. Index Strategy
19. Backup & Recovery
20. Future Collections

---

# 1. Overview

The application uses **Google Cloud Firestore** as the primary database.

Firestore is chosen because it provides:

- Real-time synchronization
- High scalability
- Offline support
- Flexible schema
- Secure access rules
- Seamless integration with Firebase Authentication

The database is organized into collections and documents optimized for a parent-child learning model.

---

# 2. Database Technology

Database Provider

Google Firebase

Database

Cloud Firestore

Storage

Firebase Storage

Authentication

Firebase Authentication

Analytics

Firebase Analytics

Crash Reports

Firebase Crashlytics

---

# 3. Top-Level Collections

```
parents
children
curriculum
lessons
quizzes
progress
daily_plans
rewards
voice_sessions
ai_conversations
settings
analytics
```

---

# 4. Parent Collection

Collection

```
parents
```

Example Document

```json
{
  "parentId": "",
  "fullName": "",
  "email": "",
  "country": "",
  "preferredLanguage": "Urdu",
  "subscriptionPlan": "Free",
  "createdAt": "",
  "lastLogin": "",
  "childrenCount": 2
}
```

---

# 5. Child Collection

Collection

```
children
```

Example Document

```json
{
  "childId": "",
  "parentId": "",
  "name": "",
  "age": 7,
  "grade": 2,
  "gender": "",
  "avatar": "",
  "language": "Urdu",
  "interests": [
      "Robots",
      "Animals",
      "Games"
  ],
  "learningStyle": "Visual",
  "currentLevel": 1,
  "createdAt": ""
}
```

---

# 6. Curriculum Collection

Stores personalized curriculum generated for each child.

Collection

```
curriculum
```

Fields

```
curriculumId
childId
subject
module
chapter
lessonOrder
difficulty
estimatedDuration
learningObjectives
status
```

---

# 7. Lesson Collection

Collection

```
lessons
```

Fields

```
lessonId
childId
title
description
story
activities
codingExercise
quizId
estimatedMinutes
difficulty
completed
createdAt
```

---

# 8. Quiz Collection

Collection

```
quizzes
```

Fields

```
quizId
lessonId
childId
questions
correctAnswers
score
completed
completedAt
```

---

# 9. Progress Collection

Tracks learning performance.

Collection

```
progress
```

Fields

```
progressId
childId
completedLessons
completedQuizzes
averageScore
currentXP
currentLevel
dailyStreak
weakTopics
strongTopics
lastStudied
```

---

# 10. Rewards Collection

Collection

```
rewards
```

Fields

```
rewardId
childId
coins
stars
badges
certificates
achievements
avatarsUnlocked
```

---

# 11. Daily Learning Plan

Collection

```
daily_plans
```

Fields

```
planId
childId
date
lessonIds
estimatedTime
completed
```

---

# 12. AI Conversation History

Collection

```
ai_conversations
```

Fields

```
conversationId
childId
timestamp
topic
userMessage
aiResponse
lessonReference
```

Only educational conversations are stored.

Sensitive information should never be included.

---

# 13. Voice Sessions

Collection

```
voice_sessions
```

Fields

```
sessionId
childId
duration
speechLanguage
lessonId
voiceProvider
createdAt
```

Raw audio is not permanently stored unless parents explicitly enable it.

---

# 14. App Settings

Collection

```
settings
```

Stores

- Theme
- Language
- Daily reminder time
- Screen time limits
- Voice preferences
- Accessibility settings

---

# 15. Analytics

Collection

```
analytics
```

Tracks

- Lesson completion
- Session duration
- Feature usage
- Daily active users
- Weekly engagement
- Error logs

Personally identifiable information should not be stored in analytics events.

---

# 16. Firestore Security Rules

Principles

- Parents can access only their own data.
- Children never authenticate directly.
- Every document is validated.
- Read/write access is restricted by Firebase Authentication.
- Sensitive collections require authenticated access.

---

# 17. Collection Relationships

```
Parent
   │
   ├─────────────► Children
   │                     │
   │                     ├────────► Curriculum
   │                     ├────────► Lessons
   │                     ├────────► Quizzes
   │                     ├────────► Progress
   │                     ├────────► Rewards
   │                     ├────────► Daily Plans
   │                     ├────────► Voice Sessions
   │                     └────────► AI Conversations
```

---

# 18. Index Strategy

Create composite indexes for:

- childId + createdAt
- childId + completed
- parentId + createdAt
- lessonId + childId
- progress + childId

Indexes improve query performance while keeping costs predictable.

---

# 19. Backup & Recovery

- Daily automated Firestore exports
- Weekly integrity checks
- Versioned backups for curriculum data
- Disaster recovery procedures documented separately

---

# 20. Future Collections

Future versions may introduce:

```
teachers
schools
classrooms
projects
coding_submissions
leaderboards
friends
notifications
payments
marketplace
```

These collections are intentionally excluded from Version 1 to keep the MVP focused.

---

# Database Design Principles

1. Simplicity
2. Scalability
3. Security
4. Performance
5. Child Privacy
6. Offline Support
7. Cost Efficiency

---

# Approval

Approved for UI/UX Design

Next Document

04_UI_UX_WIREFRAMES.md
