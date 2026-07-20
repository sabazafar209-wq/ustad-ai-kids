# API Specification

---

# API Version

v1

---

## Authentication

POST /register

POST /login

POST /logout

POST /reset-password

---

## Parent

GET /parent

PUT /parent

DELETE /parent

---

## Children

GET /children

POST /children

PUT /children/{id}

DELETE /children/{id}

---

## Lessons

GET /lessons

GET /lessons/{id}

POST /lessons/start

POST /lessons/complete

---

## AI

POST /ai/chat

POST /ai/lesson

POST /ai/quiz

POST /ai/project

---

## Progress

GET /progress

GET /progress/{childId}

---

## Rewards

GET /rewards

POST /rewards/claim

---

## Voice

POST /voice/start

POST /voice/end

POST /voice/transcribe

POST /voice/speak

---

## Reports

GET /reports/weekly

GET /reports/monthly

---

## Health

GET /health

GET /version

---

# Response Format

```json
{
  "success": true,
  "message": "",
  "data": {}
}
```

---

# Error Format

```json
{
  "success": false,
  "error": {
    "code": 400,
    "message": ""
  }
}
```

---

# Approval

Approved for Software Development
