import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'dart:convert'; // To parse JSON responses
import 'package:connectivity_plus/connectivity_plus.dart'; // Connectivity package
import 'package:shared_preferences/shared_preferences.dart';
import 'Page21.dart';
import 'Page4.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

bool _isPasswordVisible = false; // Tracks password visibility

class _Page3State extends State<Page3> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<bool> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You are offline')),
      );
      return false;
    }
    return true;
  }

  void login(String email, String password) async {
    if (!await checkConnectivity()) return; // Check if offline

    setState(() {
      _isLoading = true;
    });

    try {
      Response response = await post(
        Uri.parse('https://nda.qaadvance.com/api/login'),
        body: {'email': email, 'password': password},
      );

      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        // Extract user details
        String name = responseBody['user']['name'];
        String email = responseBody['user']['email'];

        // Save in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_name', name);
        await prefs.setString('user_email', email);

        print('Login successful, user data saved');

        print(response.body);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Page21()),
        );

        print('Login successful');
      } else {
        // Parse the response body
        final responseBody = jsonDecode(response.body);

        if (responseBody['message'] == 'Email not found.') {
          // Email does not exist
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email does not exist')),
          );
        } else if (responseBody['message'] ==
            'Invalid credentials theek da credentials') {
          // Password is incorrect
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password is incorrect')),
          );
        } else {
          // Generic error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${responseBody['message']}')),
          );
        }
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
              const SizedBox(height: 60),
              Center(
                child: SvgPicture.asset(
                  'assets/nda logo image.svg',
                  semanticsLabel: 'Logo',
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: screenSize.width - 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        const Text(
                          'Welcome Back',
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Lorem Ipsum is simply dummy text of the \n       printing and typesetting industry.',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            controller: usernameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
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
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              suffixIcon: const Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              hintText: 'Username or Email',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText:
                                !_isPasswordVisible, // Hide/show password
                            validator: (value) {
                              if (value == null || value.length < 6) {
                                return 'Password must be at least 6 characters';
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
                        const Padding(
                          padding: EdgeInsets.only(left: 160),
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 20),
                        _isLoading
                            ? const CircularProgressIndicator()
                            : TextButton(
                                onPressed: () {

                                  if (_formKey.currentState?.validate() ??
                                      false
                                  ) {
                                    login(
                                      usernameController.text,
                                      passwordController.text,
                                    );
                                  }
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.lightBlueAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                child: Container(
                                  height: 40,
                                  width: 230,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don’t have an account?',
                                style: TextStyle(fontSize: 15)),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Page4()));
                              },
                              child: const Text('Sign Up',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.lightBlueAccent,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ],
                        ),
                      ],
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
