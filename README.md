# 💰 Expense Tracker

A full-stack expense tracking application built with **Flutter** and **FastAPI**. The project allows users to securely manage their personal income and expenses through a modern mobile interface and RESTful backend.

## 🚀 Features

### Authentication
- User registration
- User login
- JWT authentication
- Secure password hashing

### Expense Management
- Add new expenses
- Categorize transactions
- Income & expense support
- REST API integration

### Dashboard
- Current balance display
- Income & expense summary
- Recent transactions list

## 🛠️ Tech Stack

### Frontend
- Flutter
- Dart
- Material Design

### Backend
- FastAPI
- SQLAlchemy
- SQLite
- JWT Authentication
- Pydantic

### DevOps
- Docker
- Git & GitHub

## 📂 Project Structure

```
expense_tracker/
│
├── backend/
│   ├── routers/
│   ├── models/
│   ├── schemas/
│   ├── database.py
│   └── main.py
│
├── frontend/
│   └── expense_tracker_flutter/
│
└── README.md
```

## ⚙️ Installation

### Backend

```bash
cd backend
pip install -r requirements.txt
uvicorn main:app --reload
```

### Frontend

```bash
cd frontend/expense_tracker_flutter
flutter pub get
flutter run
```

## 📌 API

Main endpoints include:

- POST `/users/register`
- POST `/users/login`
- GET `/expenses`
- POST `/expenses`
- PUT `/expenses/{id}`
- DELETE `/expenses/{id}`

## 📷 Screens

- Welcome
- Login
- Register
- Dashboard
- Add Expense
- Edit Expense
- Statistics
- Profile

## 🔄 Current Status

The project successfully demonstrates:

- Flutter frontend development
- FastAPI REST API development
- Authentication with JWT
- Expense CRUD architecture
- Frontend–backend integration for authentication and expense creation

Some dashboard and editing functionalities are prepared for further integration and future improvements.

## 👩‍💻 Author

**Sahra Demir**

Computer Engineering Student  
Istanbul Bilgi University
