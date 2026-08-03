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

## 📱 Screenshots

<img width="805" height="530" alt="Ekran görüntüsü 2026-08-03 092255" src="https://github.com/user-attachments/assets/f91a7827-b5c9-48f6-8829-0832a2667655" />
<img width="807" height="530" alt="Ekran görüntüsü 2026-08-03 092302" src="https://github.com/user-attachments/assets/bdd8ff41-8ae3-40b7-83d3-93116bc8f1d4" />
<img width="437" height="697" alt="Ekran görüntüsü 2026-08-03 092830" src="https://github.com/user-attachments/assets/6594b023-3415-4b98-bce6-e17b9f9eff14" />
<img width="263" height="418" alt="Ekran görüntüsü 2026-08-03 092520" src="https://github.com/user-attachments/assets/e47fe358-0210-40f3-a4b6-08468648ce4e" />


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
