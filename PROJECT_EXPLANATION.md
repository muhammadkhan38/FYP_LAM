# FYP_LAM - Legal Agreement Management System

## Project Overview

**FYP_LAM** (Final Year Project - Legal Agreement Management) is a comprehensive Flutter-based mobile application designed to streamline the creation, management, and digital signing of legal agreements, with a primary focus on Non-Disclosure Agreements (NDAs) and other business contracts.

## 🎯 Purpose and Vision

This application addresses the need for a digital solution that:
- Simplifies legal agreement creation process
- Provides pre-built templates for common agreement types
- Enables digital signature functionality
- Manages agreement lifecycle from draft to completion
- Offers secure user authentication and data management

## 🏗️ Technical Architecture

### **Frontend: Flutter Application**
- **Framework**: Flutter (Dart 3.5.4+)
- **Target Platforms**: Android, iOS, Windows, Linux, macOS, Web
- **State Management**: StatefulWidget-based state management
- **Navigation**: Standard Flutter navigation with MaterialPageRoute

### **Backend Integration**
- **API Base URL**: `https://nda.yourailist.com/api/`
- **Authentication**: Token-based authentication system
- **Data Format**: JSON for API communication
- **Storage**: Local (SharedPreferences) + Remote (API)

### **Key Dependencies**
```yaml
dependencies:
  flutter_svg: ^2.0.17          # SVG image support
  http: ^1.3.0                  # HTTP client for API calls
  shared_preferences: ^2.2.2    # Local data persistence
  connectivity_plus: ^6.1.3     # Network connectivity checking
  signature: ^5.5.0             # Digital signature capture
  path_provider: ^2.1.5         # File system access
  pin_code_fields: ^8.0.1       # PIN/OTP input fields
```

## 📱 Application Flow and Screens

### **1. Application Startup**
- **SplashScreen.dart**: Initial loading screen with logo animation
- **Token Validation**: Checks for existing user authentication
- **Auto-navigation**: Redirects to MainScreen (new users) or Page21 (authenticated users)

### **2. Authentication System**
- **MainScreen.dart**: Welcome/landing page with login/register options
- **page3.dart**: User login with email/password authentication
- **Page4.dart**: User registration with comprehensive form validation
- **Page5.dart**: OTP verification for new registrations

### **3. Dashboard and Agreement Management**
- **Page21.dart**: Main dashboard displaying user's agreements
- **Agreement Listing**: Shows draft, pending, and completed agreements
- **Status Filtering**: Filter agreements by status (draft/complete/pending)

### **4. Agreement Creation Workflow**
- **Template Selection**: Choose from pre-built agreement templates
- **Agreement_detail.dart**: Main agreement creation interface
- **Dynamic Fields**: Customizable key-value pairs for agreement terms
- **Digital Signature**: Integrated signature capture functionality
- **Draft Saving**: Save incomplete agreements for later completion

### **5. Template System**
The application includes five pre-built agreement templates:

#### **Available Templates:**
1. **Employment Agreement** (`employment_agreement.json`)
2. **Lease Agreement** (`lease_agreement.json`)
3. **Sales Agreement** (`sales_agreement.json`)
4. **Partnership Agreement** (`partnership_agreement.json`)
5. **Property Deal Agreement** (`property_deal_agreement.json`)

Each template contains structured JSON data with:
- Agreement metadata (title, parties, date)
- Detailed description sections
- Signature blocks
- Legal clauses and terms

## 🔧 Core Features

### **1. User Management**
- **Registration**: Email, phone, name, DOB, ID number validation
- **Authentication**: Secure login with token-based sessions
- **Profile Management**: User data stored in SharedPreferences
- **Session Persistence**: Automatic login for returning users

### **2. Agreement Creation**
```dart
// Example Agreement Structure
{
  "Agreement": {
    "title": "Employment Agreement",
    "parties": {
      "Employer": {"name": "Company Name"},
      "Employee": {"name": "Employee Name"}
    },
    "date": "2024-01-01",
    "Description": {
      "Position_and_Responsibilities": "Job description...",
      "Compensation_and_Benefits": "Salary details...",
      // ... additional custom fields
    }
  }
}
```

### **3. Digital Signature System**
- **Signature Capture**: Touch-based signature drawing
- **Base64 Encoding**: Signatures converted to Base64 for API transmission
- **Validation**: Ensures signatures are present before agreement finalization
- **Multiple Parties**: Support for multiple signature blocks

### **4. Draft Management**
- **Local Storage**: Drafts saved to device storage as JSON files
- **Auto-save**: Automatic saving of work in progress
- **Resume Editing**: Continue working on saved drafts
- **Version Control**: Track changes and modifications

### **5. API Integration**

#### **Key API Endpoints:**
```
POST /api/register          # User registration
POST /api/login             # User authentication
POST /api/create_agreement  # Create/update agreements
POST /api/getAgreements     # Fetch user agreements
POST /api/getSingleAgreement # Get specific agreement details
```

#### **Data Flow:**
1. **User Authentication** → Token generation and storage
2. **Agreement Creation** → JSON serialization and API submission
3. **Agreement Retrieval** → API calls with user email filtering
4. **Status Management** → Draft/Complete/Pending state tracking

## 📁 Project Structure

```
lib/
├── main.dart                 # Application entry point
├── SplashScreen.dart        # Initial loading screen
├── MainScreen.dart          # Welcome/landing page
├── page3.dart               # Login screen
├── Page4.dart               # Registration screen
├── Page21.dart              # Main dashboard
├── Template/
│   ├── Agreement_detail.dart # Agreement creation interface
│   └── ...                  # Template-related utilities
├── Widgets/                 # Reusable UI components
├── APIService.dart          # API communication utilities
└── ...                      # Additional screens and utilities

assets/
├── *.json                   # Agreement templates
├── *.svg                    # Vector graphics
├── *.png                    # Raster images
└── background image.png     # App background
```

## 🚀 Key Functionalities

### **Agreement Lifecycle:**
1. **Template Selection** → Choose appropriate agreement type
2. **Information Input** → Fill required fields and custom terms
3. **Review** → Preview generated agreement
4. **Digital Signing** → Capture required signatures
5. **Submission** → Send to API for processing
6. **Management** → Track status and access completed agreements

### **User Experience Features:**
- **Responsive Design**: Adapts to different screen sizes
- **Offline Capability**: Draft saving works without internet
- **Form Validation**: Comprehensive input validation
- **Error Handling**: Graceful error management and user feedback
- **Progress Indicators**: Loading states for all async operations

## 🔒 Security and Data Management

### **Authentication Security:**
- Token-based authentication with session management
- Secure storage of user credentials and tokens
- Automatic session validation and renewal

### **Data Protection:**
- Local data encryption through SharedPreferences
- Secure API communication over HTTPS
- Input validation and sanitization
- Error handling to prevent data exposure

### **Agreement Security:**
- Digital signatures with Base64 encoding
- JSON structure validation
- Secure file storage for drafts
- API-level agreement access control

## 🎨 User Interface Design

### **Design Principles:**
- **Material Design**: Follows Flutter's Material Design guidelines
- **Consistent Theming**: Unified color scheme and typography
- **Intuitive Navigation**: Clear user flow and navigation patterns
- **Accessibility**: Support for various device sizes and orientations

### **Visual Elements:**
- **Custom Backgrounds**: Branded background images
- **SVG Icons**: Scalable vector graphics for crisp display
- **Form Components**: Custom text fields and input validation
- **Signature Canvas**: Interactive signature capture interface

## 🔧 Technical Implementation Details

### **State Management:**
```dart
// Example state management pattern
class _AgreementDetailState extends State<AgreementDetail> {
  Map<String, TextEditingController> descriptionController = {};
  bool _isLoading = false;
  
  Future<void> _sendDataToAPI() async {
    setState(() => _isLoading = true);
    // API communication logic
    setState(() => _isLoading = false);
  }
}
```

### **API Communication:**
```dart
// Example API call
Future<void> registerUser() async {
  final response = await http.post(
    Uri.parse('https://Nda.yourailist.com/api/register'),
    body: {
      'name': nameController.text,
      'email': emailController.text,
      // ... other fields
    },
  );
  // Handle response
}
```

### **Local Storage:**
```dart
// SharedPreferences usage
SharedPreferences prefs = await SharedPreferences.getInstance();
await prefs.setString('user_token', token);
await prefs.setString('user_email', email);
```

## 🚀 Getting Started

### **Prerequisites:**
- Flutter SDK (3.5.4+)
- Dart SDK
- Android Studio / VS Code
- Physical device or emulator

### **Installation:**
1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Configure API endpoints if needed
4. Run `flutter run` to start the application

### **Configuration:**
- Update API base URL in service files if backend changes
- Configure signing keys for production builds
- Set up appropriate permissions for file access and network

## 🔮 Future Enhancements

### **Potential Improvements:**
- **Multi-language Support**: Internationalization for global usage
- **Advanced Templates**: More specialized agreement types
- **Collaborative Editing**: Multi-user agreement creation
- **Document Export**: PDF generation and export functionality
- **Email Integration**: Automatic agreement sharing via email
- **Advanced Search**: Search and filter agreements by various criteria
- **Analytics Dashboard**: Usage statistics and agreement analytics

## 🎓 Educational Value

As a Final Year Project, this application demonstrates:
- **Mobile App Development**: Complete Flutter application lifecycle
- **API Integration**: RESTful service communication
- **User Experience Design**: Intuitive interface design principles
- **Data Management**: Local and remote data synchronization
- **Security Implementation**: Authentication and data protection
- **Software Architecture**: Modular and maintainable code structure

## 📞 Support and Maintenance

This project serves as a foundation for legal document management systems and can be extended for various business and educational purposes. The modular architecture allows for easy customization and feature additions.

---

**Note**: This application is designed for educational and demonstration purposes. For production use, additional security measures, comprehensive testing, and legal compliance reviews would be recommended.