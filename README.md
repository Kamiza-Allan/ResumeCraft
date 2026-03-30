# ResumeCraft – Intelligent Resume Builder

**ResumeCraft** is an AI-assisted resume builder that helps users create professional, ATS-friendly resumes quickly. It features guided workflows, customizable templates, smart suggestions, and PDF export, accessible through both mobile (Flutter) and web platforms via a shared backend API.

**🚀 Features**
- AI-powered writing suggestions
- Guided resume creation
- Multiple template designs
- Secure authentication (JWT)
- PDF export
- Cloud storage
- Shared API for mobile (Flutter) and web clients

**🛠️ Tech Stack**
- Frontend (Web & Mobile): Flutter (Dart)
- Backend: Django REST Framework, PostgreSQL, SimpleJWT
- AI: OpenAI API

**🏗️ Architecture Overview**
ResumeCraft follows a layered client–server architecture:
**Flutter App (Interface Layer)**
Handles user interaction, resume editing UI, navigation, and state management

**Django REST API (Control Layer)**
Manages authentication, business logic, resume processing, and AI orchestration

**AI Service (Intelligence Layer)**
Provides smart suggestions, resume optimization, and content generation

**PostgreSQL Database**
Stores user data, resumes, templates, and system records

**🔁 System Flow**
- Flutter App  →  Django REST API  →  AI Service
      ↑                ↓
      └────── JSON Response ──────┘
- Flutter communicates with Django via HTTP (JSON + JWT)
- Django securely interacts with the AI service
- All data is centralized in the backend

**📱 Flutter Application**

The **Flutter app** serves as the primary interface, supporting:
- Cross-platform development (Android, iOS, Web)
- Secure token storage
- API integration with Django backend
- Resume builder UI and real-time editing
- AI suggestion display and interaction

**📂 Project Structure**
ResumeCraft/
│
├── backend/        # Django REST API (Control Layer)
│   ├── system/
│   ├── backend/
│   └── manage.py
│
├── frontend/         # Flutter App (Interface Layer)


**📦 Setup Instructions**

**🔧 Backend Setup (Django)**
cd backend
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python manage.py migrate
python manage.py runserver

Backend runs at http://127.0.0.8000

**📱 Flutter Setup**
Ensure Flutter is installed:
flutter --version

cd frontend
flutter pub get
flutter run

**🔐 Authentication**
ResumeCraft uses JWT (JSON Web Tokens):

POST /api/auth/register/
POST /api/auth/login/

Flutter stores tokens securely and attaches them to API requests.

**🤖 AI Integration**
AI features are handled via backend APIs:
- Resume content suggestions
- Bullet point enhancement
- Skill optimization
- ATS keyword improvements

Flow:
*Flutter → Django API → AI Service → Django → Flutter*

**📄 PDF Export (WeasyPrint)**
The backend supports server-side PDF generation using WeasyPrint.
**Install system dependencies (Ubuntu/Debian):**
sudo apt-get update && sudo apt-get install -y \
  libcairo2 libpango-1.0-0 libgdk-pixbuf2.0-0 libxml2-dev libxslt1-dev \
  zlib1g-dev libjpeg-dev libffi-dev pkg-config
  
**Python dependencies (already pinned):**
pip install -r backend/requirements.txt

Important packages:
weasyprint==67.0
pydyf==0.12.1
If unavailable, Flutter/web can fallback to client-side PDF generation.

**⚙️ Continuous Integration (CI)**

GitHub Actions workflow is included:
- Runs backend tests
- Installs WeasyPrint dependencies
- Validates builds on push and PR

**🎯 Design Principles**
- Separation of concerns (UI vs Logic vs AI)
- API-first architecture
- Cross-platform consistency
- Secure authentication
- Scalable backend services
