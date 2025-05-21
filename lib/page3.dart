import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'dart:convert'; // To parse JSON responses
import 'package:connectivity_plus/connectivity_plus.dart'; // Connectivity package
import 'package:shared_preferences/shared_preferences.dart';
import 'Page21.dart';
import 'Page4.dart';

String? userToken; // Global variable to store the token

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
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You are offline')),
        );
      }
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
        Uri.parse('https://Nda.yourailist.com/api/login'),
        body: {
          'email': email, 'password': password
        },
      );

      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final Map<String, dynamic> data = json.decode(response.body);


          String token = data['token']; // Extract token
          if (kDebugMode) {
            print("User Token my nameis muhammad khan:///////////////////////////////////////////////////////////////// $token");
          } // Print token

        // Extract user details
        String name = responseBody['user']['name']??"";
        String email = responseBody['user']['email']??"";




       // Save in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_token', token);
        await prefs.setString('user_name', name);
        await prefs.setString('user_email', email);


        if (kDebugMode) {
          print(token);
        }







        if (kDebugMode) {
          print('Login successful, user data saved');
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Page21()),
        );

        if (kDebugMode) {
          print('Login successful');
        }
      } else {
        // Parse the response body
        final responseBody = jsonDecode(response.body);
        if(responseBody["status"]==301){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email does not exist')),
          );
        }


        // if (responseBody['message'] == 'Email not found.') {
        //   // Email does not exist
        //
        // }
        else if (responseBody['message'] ==
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

      if (e is SocketException) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You are offline')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
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
                                borderSide: const BorderSide(
                                  width: 0,
                                  color: Colors.transparent, // یا Colors.grey.shade100
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
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 0,
                                  color: Colors.transparent,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 150),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Page4()));
                            },
                            child: const Text('Forgot password?',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        const SizedBox(height: 20),
                        _isLoading
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              login(
                                usernameController.text,
                                passwordController.text,
                              );

                            }

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF00C2FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            fixedSize: const Size(298, 56),
                          ),
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),

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
                                    color: Color(0xFF00C2FF),
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
