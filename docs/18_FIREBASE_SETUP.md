# Firebase Setup Guide

---

# Ustad AI Kids

### Firebase Architecture & Configuration

---

**Project:** Ustad AI Kids

**Document:** Firebase Setup

**Document ID:** FB-001

**Version:** 1.0

**Status:** Draft

**Author:** Saba Zafar

**Technical Architect:** OpenAI ChatGPT

**Date:** July 2026

---

# Purpose

This document describes how Firebase is configured for Ustad AI Kids.

Firebase provides:

- Authentication
- Firestore Database
- Cloud Storage
- Cloud Functions
- Cloud Messaging
- Analytics
- Crashlytics
- Remote Config

---

# Architecture

```
Flutter App

↓

Firebase Authentication

↓

Cloud Firestore

↓

Cloud Functions

↓

OpenAI API

↓

Response

↓

Flutter App
```

---

# Firebase Services

Version 1 uses:

✓ Authentication

✓ Firestore

✓ Storage

✓ Cloud Functions

✓ Analytics

✓ Crashlytics

Future

Remote Config

App Check

Performance Monitoring

Extensions

---

# Firebase Project

Project Name

Ustad AI Kids

Project ID

ustad-ai-kids

Default Region

asia-northeast1

Reason

Lowest latency for Japan.

Future deployments can use multiple regions.

---

# Authentication

Supported Providers

Email & Password

Google Sign-In

Apple Sign-In

Future

Microsoft

School SSO

Parent account creation requires email verification.

Children never authenticate directly.

---

# Firestore

Collections

```
parents

children

lessons

progress

quizzes

projects

rewards

curriculum

stories

analytics
```

---

# Cloud Storage

Folders

```
avatars/

lesson_images/

lesson_audio/

voice/

curriculum/

badges/

animations/

projects/
```

---

# Cloud Functions

Responsibilities

AI Request

Lesson Generation

Quiz Generation

Parent Reports

Notifications

Scheduled Tasks

Reward Calculation

---

# Cloud Messaging

Notifications

Daily Reminder

Weekly Report

Learning Streak

New Lesson

Achievement

System Announcement

Parents control notification preferences.

---

# Analytics

Track

App Opens

Lesson Starts

Lesson Completion

Quiz Scores

Voice Usage

Coding Sessions

Learning Time

Retention

AI Response Time

---

# Crashlytics

Capture

App Crashes

Exceptions

Fatal Errors

Flutter Errors

Cloud Function Failures

---

# Firebase Security Rules

Principles

Least Privilege

Parent Isolation

Authenticated Access

Server Validation

Parents can only access their own children.

Children cannot access Firebase directly.

---

# Firestore Rules

Parents

Read

Own Documents

Write

Own Documents

Delete

Own Documents

Admin

Server Only

---

# Cloud Function Rules

Every function validates:

Authentication

Ownership

Input

Rate Limits

Permissions

---

# Environment Variables

Never hardcode

API Keys

Secrets

Project IDs

Use

```
.env

Flutter Secure Storage

GitHub Secrets
```

---

# Local Development

Use

Firebase Emulator Suite

Benefits

Offline Testing

Fast Development

No Billing

Safe Testing

---

# Backup Strategy

Firestore Export

Weekly

Storage Backup

Monthly

Cloud Function Source

GitHub

---

# Monitoring

Firebase Console

Crashlytics

Analytics

Cloud Logs

Function Logs

Performance Dashboard

---

# Cost Optimization

Cache AI Responses

Compress Images

Limit Reads

Batch Writes

Archive Old Data

Optimize Cloud Functions

---

# Disaster Recovery

Daily Firestore Backup

Version-Controlled Cloud Functions

Rollback Procedure

Incident Checklist

---

# Security Checklist

✓ Email Verification

✓ Firestore Rules

✓ Cloud Function Validation

✓ Secure Storage

✓ HTTPS Only

✓ Input Validation

✓ Rate Limiting

✓ Audit Logging

---

# Deployment Checklist

Firebase Project Created

Authentication Enabled

Firestore Created

Rules Published

Indexes Created

Storage Configured

Cloud Functions Deployed

Analytics Enabled

Crashlytics Enabled

Environment Variables Added

---

# Future Improvements

App Check

Performance Monitoring

Remote Config

AI Caching

Multi-region Firestore

Offline Synchronization

---

# Approval

Approved for OpenAI Integration

Next Document

19_OPENAI_INTEGRATION.md
