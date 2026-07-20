# Voice Engine

---

# Ustad AI Kids

### Voice Interaction System

---

**Project:** Ustad AI Kids

**Document:** Voice Engine

**Document ID:** VE-001

**Version:** 1.0

**Status:** Approved for Development

**Author:** Saba Zafar

**Technical Architect:** OpenAI ChatGPT

**Date:** July 2026

---

# Purpose

This document defines the voice interaction system used by Ustad AI Kids.

The objective is to provide a natural, child-friendly conversational learning experience where children communicate with the AI teacher entirely through voice.

---

# Objectives

The voice engine shall:

- Listen to the child
- Convert speech to text
- Send the request to the AI
- Receive AI response
- Convert response into speech
- Play the audio naturally

---

# Voice Pipeline

```
Child Speaks

↓

Speech-to-Text

↓

Intent Processing

↓

AI Teaching Engine

↓

Text Response

↓

Text-to-Speech

↓

Audio Playback
```

---

# Components

The Voice Engine consists of:

Speech Recognition

Voice Controller

Conversation Manager

Text-to-Speech

Audio Player

Session Manager

---

# Speech Recognition

Responsibilities

- Listen to microphone
- Detect end of speech
- Convert Urdu speech into text
- Return recognized text

Output

```
String recognizedText
```

---

# Voice Controller

Responsibilities

- Start listening
- Stop listening
- Restart listening
- Handle microphone permissions

---

# Conversation Manager

Responsibilities

- Send child's message to AI
- Receive AI response
- Maintain conversation order
- Prevent duplicate requests

---

# Text-to-Speech

Responsibilities

- Convert AI response into spoken Urdu
- Control speaking speed
- Control speaking volume
- Stop speech when interrupted

---

# Audio Player

Responsibilities

- Play generated speech
- Pause
- Resume
- Stop

---

# Session Flow

```
Start Lesson

↓

AI Greeting

↓

Child Speaks

↓

Speech Recognition

↓

AI Response

↓

Speech Output

↓

Next Question

↓

Lesson Complete
```

---

# Voice States

Idle

Listening

Processing

Speaking

Paused

Completed

Error

---

# User Experience

The child should always know what the app is doing.

Examples

🎤 Listening...

🧠 Thinking...

🗣️ Ustad is speaking...

✅ Your turn.

---

# Supported Language

Version 1

Primary

Urdu

Secondary

English (Interface Only)

---

# Voice Interaction Rules

The AI should:

- Speak slowly
- Use short sentences
- Avoid technical jargon
- Pause naturally
- Ask one question at a time
- Wait for the child's response

---

# Maximum Response Length

Normal explanation

30–60 seconds

Story

1–2 minutes

Quiz question

10–20 seconds

---

# Interruption Handling

If the child starts speaking while AI is talking:

- Stop speech playback
- Listen immediately
- Continue conversation

---

# Error Handling

If speech recognition fails:

Display:

"I didn't catch that. Can you say it again?"

Retry automatically.

---

# Silence Detection

If no speech is detected for 10 seconds:

Prompt:

"Take your time. I'm listening."

---

# Audio Quality

Requirements

Clear pronunciation

Natural pacing

Child-friendly tone

No robotic effects

---

# Performance Targets

Speech Recognition

< 2 seconds

AI Response

< 5 seconds

Speech Generation

< 3 seconds

Total waiting time

< 8 seconds

---

# Privacy

Voice recordings are processed only for lesson interaction.

No permanent storage of raw voice recordings.

Only lesson progress and necessary metadata are stored.

---

# Flutter Services

```
speech_to_text_service.dart

text_to_speech_service.dart

voice_controller.dart

audio_player_service.dart

conversation_manager.dart
```

---

# Dependencies

Flutter

speech_to_text

flutter_tts

just_audio

permission_handler

---

# Testing Checklist

✓ Microphone permission

✓ Urdu speech recognition

✓ AI response generation

✓ Speech playback

✓ Conversation continuity

✓ Error recovery

✓ Background interruption handling

---

# Acceptance Criteria

The Voice Engine is complete when:

- Child can speak naturally
- Speech is recognized accurately
- AI responds correctly
- Response is spoken clearly
- Conversation continues smoothly
- No manual typing is required

---

# Approval

Approved for Development

End of Core Technical Documentation
