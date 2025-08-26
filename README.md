# FYP_LAM - Legal Agreement Management System

A comprehensive Flutter-based mobile application for creating, managing, and digitally signing legal agreements, with a focus on NDAs and business contracts.

## 🎯 Project Overview

**FYP_LAM** (Final Year Project - Legal Agreement Management) is a digital solution that streamlines the legal agreement creation process, offering:

- 📝 **Pre-built Templates**: Employment, Lease, Sales, Partnership, and Property Deal agreements
- ✍️ **Digital Signatures**: Secure signature capture and validation
- 💾 **Draft Management**: Save and resume work on incomplete agreements
- 👥 **User Management**: Secure authentication and profile management
- 🔄 **Real-time Sync**: Cloud-based agreement storage and retrieval

## 🚀 Quick Start

### Prerequisites
- Flutter SDK (3.5.4+)
- Dart SDK
- Android Studio / VS Code

### Installation
```bash
# Clone the repository
git clone https://github.com/muhammadkhan38/FYP_LAM.git

# Navigate to project directory
cd FYP_LAM

# Install dependencies
flutter pub get

# Run the application
flutter run
```

## 📱 Key Features

- **🔐 User Authentication**: Secure login/registration system
- **📋 Agreement Templates**: Ready-to-use legal document templates
- **✏️ Custom Fields**: Dynamic form fields for personalized agreements
- **🖊️ Digital Signatures**: Touch-based signature capture
- **💾 Draft Saving**: Local and cloud storage for work-in-progress
- **📊 Agreement Management**: Track and manage all your agreements
- **🌐 API Integration**: RESTful backend for data synchronization

## 🏗️ Tech Stack

- **Frontend**: Flutter (Dart)
- **Backend**: REST API (`https://nda.yourailist.com/api/`)
- **Storage**: SharedPreferences (local) + Cloud API
- **Signatures**: Custom signature capture widget
- **UI**: Material Design with custom theming

## 📁 Project Structure

```
lib/
├── main.dart              # App entry point
├── SplashScreen.dart      # Loading screen
├── MainScreen.dart        # Welcome page
├── Template/              # Agreement templates
│   └── Agreement_detail.dart
├── Widgets/              # Reusable components
└── API/                  # Service classes

assets/
├── *.json               # Agreement templates
├── *.svg               # Vector graphics
└── *.png               # Images
```

## 📖 Documentation

For detailed project explanation, architecture, and implementation details, see:
- [**Complete Project Documentation**](PROJECT_EXPLANATION.md)

## 🔧 Configuration

1. **API Endpoints**: Update base URL in service files if needed
2. **Authentication**: Configure API keys and authentication settings
3. **Storage**: Set up appropriate file and network permissions

## 🤝 Contributing

This is a Final Year Project demonstrating:
- Mobile app development with Flutter
- RESTful API integration
- User authentication and data management
- Digital signature implementation
- Document management systems

## 📄 License

This project is for educational purposes. See individual file headers for specific licensing information.

## 📞 Support

For questions or support regarding this Final Year Project, please refer to the comprehensive documentation in `PROJECT_EXPLANATION.md`.

---

**Built with ❤️ using Flutter**
