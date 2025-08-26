# Technical Architecture Guide

## System Architecture Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                    FYP_LAM Mobile Application                   │
├─────────────────────────────────────────────────────────────────┤
│                         Flutter UI Layer                        │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐│
│  │ SplashScreen│ │ MainScreen  │ │   Page21    │ │ Agreement   ││
│  │             │ │             │ │ (Dashboard) │ │   Detail    ││
│  └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘│
├─────────────────────────────────────────────────────────────────┤
│                      Business Logic Layer                       │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐│
│  │    Auth     │ │  Agreement  │ │   Template  │ │  Signature  ││
│  │  Services   │ │   Manager   │ │   Handler   │ │   Service   ││
│  └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘│
├─────────────────────────────────────────────────────────────────┤
│                      Data Access Layer                          │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐│
│  │    HTTP     │ │ SharedPrefs │ │   Local     │ │   JSON      ││
│  │   Client    │ │   Storage   │ │   Files     │ │  Templates  ││
│  └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘│
└─────────────────────────────────────────────────────────────────┘
                                │
                                │ HTTPS/REST API
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│                    Backend API Server                          │
│                 (https://nda.yourailist.com)                   │
├─────────────────────────────────────────────────────────────────┤
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐│
│  │  User Auth  │ │  Agreement  │ │   Storage   │ │   Email     ││
│  │  Endpoints  │ │  Management │ │   Service   │ │   Service   ││
│  └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘│
└─────────────────────────────────────────────────────────────────┘
```

## Data Flow Architecture

### 1. User Authentication Flow
```
User Input → Login Screen → Validation → API Call → Token Storage → Dashboard
```

### 2. Agreement Creation Flow
```
Template Selection → Form Filling → Signature Capture → Local Save → API Submit → Confirmation
```

### 3. Agreement Management Flow
```
Dashboard → API Fetch → Local Cache → Display List → Detail View → Actions (Edit/View/Share)
```

## Component Architecture

### Core Components

#### **Authentication System**
- **Login/Register**: `page3.dart`, `Page4.dart`
- **Token Management**: SharedPreferences storage
- **Session Handling**: Automatic token validation

#### **Agreement Engine**
- **Template System**: JSON-based agreement templates
- **Dynamic Forms**: Runtime field generation
- **Validation**: Input validation and error handling

#### **Signature System**
- **Capture**: Touch-based signature drawing
- **Processing**: Base64 encoding and compression
- **Storage**: Local and remote signature storage

#### **Data Management**
- **Local Storage**: SharedPreferences for user data
- **File System**: JSON files for draft agreements
- **API Integration**: RESTful communication with backend

## Security Architecture

### Authentication Security
```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Client    │───▶│    API      │───▶│  Database   │
│ (Flutter)   │    │   Server    │    │             │
└─────────────┘    └─────────────┘    └─────────────┘
      │                   │                   │
      │ Token-based       │ JWT Validation    │ Encrypted
      │ Authentication    │ & Authorization   │ Storage
      ▼                   ▼                   ▼
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│SharedPrefs  │    │   HTTPS     │    │   Secure    │
│  Storage    │    │   Only      │    │   Queries   │
└─────────────┘    └─────────────┘    └─────────────┘
```

### Data Protection
- **Encryption**: HTTPS for all API communications
- **Local Security**: Secure storage of sensitive data
- **Input Validation**: Client and server-side validation
- **Error Handling**: Secure error messages

## API Architecture

### Endpoint Structure
```
Base URL: https://nda.yourailist.com/api/

Authentication:
├── POST /register         # User registration
└── POST /login           # User authentication

Agreement Management:
├── POST /create_agreement  # Create/update agreement
├── POST /getAgreements    # Fetch user agreements
└── POST /getSingleAgreement # Get specific agreement

User Management:
├── GET /profile          # User profile data
└── PUT /profile          # Update profile
```

### Request/Response Format
```json
// Example Request
{
  "email": "user@example.com",
  "agreement_file": "{...}",
  "signature": "base64_encoded_signature",
  "status": "draft"
}

// Example Response
{
  "success": true,
  "agreement_id": 123,
  "message": "Agreement created successfully"
}
```

## File Structure Architecture

```
FYP_LAM/
├── android/             # Android-specific files
├── ios/                 # iOS-specific files
├── lib/                 # Main application code
│   ├── main.dart        # Entry point
│   ├── screens/         # UI screens
│   ├── services/        # Business logic
│   ├── models/          # Data models
│   ├── widgets/         # Reusable components
│   └── utils/           # Utility functions
├── assets/              # Static assets
│   ├── images/          # Image files
│   ├── templates/       # Agreement templates
│   └── icons/           # App icons
├── test/               # Test files
└── pubspec.yaml        # Dependencies
```

## Performance Architecture

### Optimization Strategies
1. **Lazy Loading**: Load templates and data on demand
2. **Caching**: Store frequently accessed data locally
3. **Image Optimization**: SVG for scalable graphics
4. **API Efficiency**: Minimize API calls with smart caching

### Memory Management
- **Controller Disposal**: Proper cleanup of text controllers
- **State Management**: Efficient state updates
- **Resource Management**: Proper handling of file operations

## Scalability Considerations

### Horizontal Scaling
- **Modular Architecture**: Easy feature addition
- **Service Separation**: Independent service modules
- **API Versioning**: Support for multiple API versions

### Vertical Scaling
- **Performance Optimization**: Efficient algorithms and data structures
- **Resource Management**: Memory and CPU optimization
- **Caching Strategies**: Multi-level caching implementation

## Development Architecture

### Development Workflow
```
Development → Testing → Staging → Production
     ↓          ↓         ↓         ↓
   Debug    Unit Tests  Integration  Release
   Mode     Widget Tests   Tests     Build
```

### Code Organization Principles
1. **Separation of Concerns**: Clear separation between UI, business logic, and data
2. **Reusability**: Modular components and services
3. **Maintainability**: Clean, documented code
4. **Testability**: Testable architecture with dependency injection

## Deployment Architecture

### Mobile Deployment
- **Android**: APK/AAB via Google Play Store
- **iOS**: IPA via Apple App Store
- **Web**: PWA deployment for web browsers

### CI/CD Pipeline
```
Git Push → Build → Test → Package → Deploy → Monitor
```

This architecture ensures scalability, maintainability, and security while providing a smooth user experience across all supported platforms.