# 📚 Emt7any - Smart Examination Platform

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-blue?style=for-the-badge)

**A Modern Smart Examination Solution for Egyptian Secondary Students**

[Features](#-features) • [Screenshots](#-screenshots) • [Installation](#-installation) • [Technologies](#-technologies) • [Architecture](#-architecture)

</div>

---

## 📖 Overview

**Emt7any** is a comprehensive mobile examination platform designed specifically for Egyptian students at the secondary education level. The application revolutionizes the traditional examination experience by providing a secure, smart, and user-friendly environment for taking exams, viewing results, and managing academic complaints.

### 🎯 Mission

To make examinations more accessible, secure, and efficient for Egyptian students while maintaining academic integrity through advanced monitoring and verification features.

---

## ✨ Features

### 🔐 Security & Verification
- **QR Code Authentication**: Teachers can verify student identity before exam start using dynamic QR codes
- **Screen Recording**: Automatic session recording during exams to ensure academic integrity
- **Secure Storage**: Sensitive data encryption using Flutter Secure Storage

### 📝 Examination System
- **Smart Navigation**: Intuitive question navigation with progress tracking
- **Seamless Experience**: Smooth transitions between questions with optimized UI/UX
- **Real-time Sync**: Instant answer submission and progress saving
- **Offline Support**: Continue exams even with unstable internet connections

### 📊 Results & Analytics
- **Final Score Dashboard**: Comprehensive exam results with detailed analytics
- **Performance Insights**: Track your progress across multiple exams
- **Historical Data**: Access all past examination results in one place

### 💬 Student Support
- **Tzlmat System**: File complaints and appeals directly through the app
- **Online Payments**: Secure payment integration for video explanations and additional services
- **Video Solutions**: Access detailed video explanations after purchasing

### 🎨 User Experience
- **Clean Design**: Minimalist and professional interface optimized for students
- **Shimmer Effects**: Smooth loading animations for better user experience
- **Toast Notifications**: Real-time feedback for all user actions
- **Arabic Support**: Full RTL support for Arabic language

---

## 🖼️ Screenshots

> Add your app screenshots here

```
[Login Screen] [Exam Dashboard] [QR Verification] [Exam Interface]
[Results Page] [Tzlmat System] [Payment Gateway] [Profile]
```

---

## 🚀 Installation

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code
- An Android or iOS device/emulator

### Steps

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/emt7any.git
cd emt7any
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Configure environment variables**
```bash
# Create .env file in the root directory
cp .env.example .env

# Add your API keys and configuration
API_BASE_URL=https://exam-api.koyeb.app

```

4. **Run the app**
```bash
flutter run
```

---

## 🛠️ Technologies

### Core Framework
- **Flutter**: Cross-platform mobile development framework
- **Dart**: Programming language optimized for building mobile apps

### State Management & Architecture
| Package | Version | Purpose |
|---------|---------|---------|
| `flutter_bloc` | ^9.1.1 | State management using BLoC pattern |
| `hydrated_bloc` | ^10.1.1 | Persist and restore BLoC state |
| `equatable` | ^2.0.7 | Value equality for Dart objects |
| `get_it` | ^8.2.0 | Service locator for dependency injection |

### Data & Storage
| Package | Version | Purpose |
|---------|---------|---------|
| `shared_preferences` | ^2.5.3 | Local key-value storage |
| `flutter_secure_storage` | ^9.2.4 | Encrypted secure storage |
| `path_provider` | ^2.1.5 | File system path access |

### Networking & API
| Package | Version | Purpose |
|---------|---------|---------|
| `dio` | ^5.9.0 | HTTP client for REST API calls |
| `flutter_dotenv` | ^6.0.0 | Environment variables management |

### Media & Recording
| Package | Version | Purpose |
|---------|---------|---------|
| `video_player` | ^2.10.0 | Video playback functionality |
| `flutter_screen_recording` | ^2.0.24 | Screen recording during exams |

### UI/UX Enhancement
| Package | Version | Purpose |
|---------|---------|---------|
| `shimmer` | ^3.0.0 | Loading state animations |
| `qr_flutter` | ^4.1.0 | QR code generation |
| `awesome_dialog` | ^3.2.1 | Beautiful dialog boxes |
| `fluttertoast` | ^8.2.12 | Toast notifications |

### Utilities
| Package | Version | Purpose |
|---------|---------|---------|
| `intl` | ^0.20.2 | Internationalization and localization |
| `cupertino_icons` | ^1.0.8 | iOS-style icons |

---

## 🏗️ Architecture

### Project Structure

```
lib/
├── core/
│   ├── constants/          # App constants and configurations
│   ├── extensions/         # Dart extensions
│   ├── helper/            # Helper classes and utilities
│   └── ui/                # Reusable UI components
│
├── feature/
│   ├── auth/              # Authentication module
│   │   ├── cubit/         # BLoC state management
│   │   ├── data/          # Data models and repositories
│   │   └── presentation/  # UI screens and widgets
│   │
│   ├── exam/              # Examination module
│   │   ├── cubit/
│   │   ├── data/
│   │   └── presentation/
│   │
│   ├── results/           # Results & analytics module
│   │   ├── cubit/
│   │   ├── data/
│   │   └── presentation/
│   │
│   ├── tzlmat/            # Complaints & support module
│   │   ├── cubit/
│   │   ├── data/
│   │   └── presentation/
│   │
│   ├── home/              # Home dashboard module
│   └── splash/            # Splash screen module
│
└── main.dart              # App entry point
```

### Design Pattern

The application follows **Clean Architecture** principles with **BLoC Pattern** for state management:

- **Presentation Layer**: UI components and BLoC consumers
- **Domain Layer**: Business logic and use cases
- **Data Layer**: Repositories, data sources, and models

### State Management Flow

```
UI Event → BLoC → Repository → API/Database
    ↑                              ↓
    └────────── BLoC State ←───────┘
```

---

## 🔒 Security Features

### Data Protection
- ✅ Encrypted local storage for sensitive information
- ✅ Secure API communication using HTTPS
- ✅ Token-based authentication
- ✅ Auto-logout on token expiration

### Exam Integrity
- ✅ QR-based identity verification
- ✅ Screen recording during exam sessions
- ✅ Time-bound exam access
- ✅ Anti-cheating mechanisms

---

## 🌐 API Integration

The app communicates with a RESTful API backend for:

- User authentication and authorization
- Exam data retrieval and submission
- Results processing and analytics
- Payment processing
- Video content delivery

### Base Configuration

```dart
// Configure in .env file
API_BASE_URL=https://exam-api.koyeb.app

```

---

---

## 🤝 Contributing

We welcome contributions from the community! Here's how you can help:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/AmazingFeature`)
3. **Commit** your changes (`git commit -m 'Add some AmazingFeature'`)
4. **Push** to the branch (`git push origin feature/AmazingFeature`)
5. **Open** a Pull Request

### Code Standards

- Follow Flutter/Dart style guidelines
- Write meaningful commit messages
- Add comments for complex logic
- Ensure all tests pass before submitting

---

## 🐛 Bug Reports & Feature Requests

Found a bug or have a feature suggestion? Please open an issue on GitHub:

- **Bug Reports**: Include screenshots, device info, and steps to reproduce
- **Feature Requests**: Describe the feature and its benefits clearly

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👥 Team

### Development Team
- **Project Lead**: [Your Name]
- **Mobile Development**: [Developer Names]
- **Backend Development**: [Developer Names]
- **UI/UX Design**: [Designer Names]

---

## 📞 Contact & Support

- **Email**: support@emt7any.com
- **Website**: [www.emt7any.com](https://www.emt7any.com)
- **Facebook**: [@emt7any](https://facebook.com/emt7any)
- **Twitter**: [@emt7any](https://twitter.com/emt7any)

---

## 🙏 Acknowledgments

- Thanks to all contributors who helped build this platform
- Flutter & Dart team for the amazing framework
- The Egyptian education community for their feedback and support

---

<div align="center">

**Made with ❤️ for Egyptian Students**

⭐ **Star this repository if you find it helpful!** ⭐

</div>