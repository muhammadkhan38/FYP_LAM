
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Page3.dart';
import 'Page5.dart';
import 'Widgets/Reusable Date Picker.dart';
import 'customtextfieldwidget.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  State<Page4> createState() => _Page4State();
}

bool _isPasswordVisible = false; // Tracks password visibility
bool _isConfirmPasswordVisible = false; // Tracks password visibility

class _Page4State extends State<Page4> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController drivingLicenseController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  String emailData = '';

  final _formKey = GlobalKey<FormState>();

  @override

  void dispose() {
    // Dispose controllers to free up memory
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dobController.dispose();
    drivingLicenseController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> registerUser() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
      emailData = emailController.text;
    });

    String url = 'https://Nda.yourailist.com/api/register';

    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          'name': nameController.text,
          'email': emailController.text,
          'phone_number': phoneController.text,
          'dob': dobController.text,
          'id_number': drivingLicenseController.text,
          'password': passwordController.text,
          'confirm_password': confirmPasswordController.text,
        },
      );

      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      var responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Page5(email: emailController.text)),
        );

        final responseBody = jsonDecode(response.body);
        final Map<String, dynamic> data = json.decode(response.body);


        String token = data['token']; // Extract token
        print("User Token my nameis muhammad khan:///////////////////////////////////////////////////////////////// $token"); // Print token

        // Extract user details
        String name = responseBody['user']['name']??"";
        String email = responseBody['user']['email']??"";




        // Save in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_token', token);
        await prefs.setString('user_name', name);
        await prefs.setString('user_email', email);


        // Registration successful
        print(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful')),
        );

      }
      //else if (response.statusCode == 422 || (responseData['message']?.contains('The email has already been taken') ?? false))
      else if (response.statusCode == 422 )
      {
        // Email already exists
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('The email has already been taken.')),
        );
      } else {
        // Other errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'] ?? 'Registration failed')),
        );
      }
    } catch (e) {
      // Exception occurred
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Exception during registration: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', emailController.text);
    await prefs.setString('name', nameController.text);

  }





  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              SizedBox(
                height: 80,
                width: 80,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/nda logo image.svg', // Path to your SVG file
                    fit: BoxFit.contain, // Adjust the fit as needed
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: screenSize.width - 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          const Text(
                            'Create Account',
                            style: TextStyle(fontSize: 24, color: Colors.black),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Lorem ipsum is simply dummy text of the\nprinting and typesetting industry.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(height: 10),

                          CustomTextFormField(
                            controller: nameController,
                            hintText: 'Full Name',
                            icon: Icons.person,
                            validator: (value) =>
                            value == null || value.isEmpty ? 'Please enter your name' : null,
                            obscureText: false,
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(


                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            hintText: 'Email Address',

                            icon: Icons.email,
                           // icon: IconButton(onPressed: (){}, icon: Icon(Icons.import_contacts)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                return 'Enter a valid email address';
                              }
                              return null;
                            }, obscureText: null,
                          ),
                          const SizedBox(height: 10),

                          //Enter your phone number text field code
                          IntlPhoneField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              hintText: "Enter Phone Number",
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.black54),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 0, color: Colors.grey.shade100),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 0,
                                  color: Colors.transparent, // یا Colors.grey.shade100
                                ),
                                borderRadius: BorderRadius.circular(40), // یہ radius برقرار رکھے گا
                              ),
                            ),
                            initialCountryCode: 'US', // ڈیفالٹ ملک کا کوڈ (آپ اپنی مرضی کا رکھ سکتے ہیں)
                            onChanged: (phone) {
                              print(phone.completeNumber); // مکمل فون نمبر (ملک کوڈ + نمبر)
                            },
                          ),

                          const SizedBox(height: 10),
                          CustomTextFormField(

                            controller: dobController,
                            hintText: 'Date of Birth',
                            icon: Icons.date_range,
                            readOnly: true, // ✅ یوزر خود کچھ نہیں لکھ سکتا
                            onTap: () => DatePickerUtil.selectDate(context, dobController), // ✅ ری یوزایبل فنکشن کال
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a date';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            controller: drivingLicenseController,
                            hintText: 'Driving License Number',
                            icon: Icons.call_to_action_rounded, obscureText: false,
                          ),

                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 5,right: 5),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText:
                              !_isPasswordVisible, // Hide/show password
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a password';
                                }

                                // Check for minimum length
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }

                                // Check for at least one uppercase letter
                                if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
                                  return 'Password must include at least one uppercase letter';
                                }

                                // Check for at least one lowercase letter
                                if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
                                  return 'Password must include at least one lowercase letter';
                                }

                                // Check for at least one digit
                                if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
                                  return 'Password must include at least one number';
                                }

                                // Check for at least one special character
                                if (!RegExp(r'(?=.*[!@#\$&*~])').hasMatch(value)) {
                                  return 'Password must include at least one special character';
                                }

                                return null; // If all conditions are met, the validation passes
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0,
                                    color: Colors.grey.shade100,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 0,
                                    color: Colors.transparent, // یا Colors.grey.shade100
                                  ),
                                  borderRadius: BorderRadius.circular(40), // یہ radius برقرار رکھے گا
                                ),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;

                                    });
                                  },
                                ),
                                hintText: 'Password',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 5,right: 5),
                            child: TextFormField(


                              controller: confirmPasswordController,
                              obscureText:
                              !_isConfirmPasswordVisible,
                              // Hide/show password
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                } else if (value != passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },

                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0,
                                    color: Colors.grey.shade100,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 0,
                                    color: Colors.transparent, // یا Colors.grey.shade100
                                  ),
                                  borderRadius: BorderRadius.circular(40), // یہ radius برقرار رکھے گا
                                ),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isConfirmPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                                    });
                                  },
                                ),
                                hintText: 'Confirm Password',
                                border: InputBorder.none,
                              ),
                            ),
                          ),





                          const SizedBox(height: 20),
                          _isLoading
                              ? const CircularProgressIndicator()
                              : ElevatedButton(
                            onPressed:(){
                              registerUser();
                              _saveData();
                            } ,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              fixedSize: const Size(250, 56),

                            ),
                            child: const Text(
                              'SIGN UP',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already have an account?', style: TextStyle(fontSize: 15)),
                              TextButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Page3()),
                                ),
                                child: const Text('Sign in', style: TextStyle(fontSize: 15)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

