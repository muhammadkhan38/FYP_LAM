import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'BigText.dart';
import 'Page21.dart';

class Page5 extends StatefulWidget {
  final String email;

  const Page5({super.key, required this.email});

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  final TextEditingController _otpController = TextEditingController();
  bool _isSubmitting = false;

  int _secondsRemaining = 60; // 🕒 1 منٹ کا ٹائمر
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    setState(() {
      _secondsRemaining = 60;
      _canResend = false;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
        timer.cancel();
      }
    });
  }

  Future<void> verifyOTP() async {
    const String apiUrl = "https://Nda.yourailist.com/api/verify";
    final String otp = _otpController.text;

    if (otp.isEmpty || otp.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid 4-digit OTP.')),
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'otp': otp, 'email': widget.email}),
      );

      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Page21()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to verify OTP. Please try again.')),
        );
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
      });
    }
  }

  Future<void> resendOTP() async {
    if (!_canResend) return;

    try {
      final response = await http.post(
        Uri.parse('https://nda.qaadvance.com/api/resendOTP'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': widget.email}),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('OTP resent successfully.')),
        );
        startTimer(); // 🔄 دوبارہ 60 سیکنڈ کا ٹائمر شروع کریں
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to resend OTP. Please try again.')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $error')),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel(); // 🛑 جب اسکرین بند ہو تو ٹائمر ختم کریں
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.navigate_before,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Center(
              child: SizedBox(
                height: 230,
                width: screenSize.width - 60,
                child: SvgPicture.asset(
                  'assets/otp verification pic.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 15),
            BigText(text: 'OTP Verification', size: 25, color: Colors.black),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 12, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: 'We have sent you a 4-digit code to your',
                      style: TextStyle(fontSize: 15, color: Colors.grey.shade500)),
                  TextSpan(
                      text: '\n\t\t\t\t\t\t\t\t\t\t\t\tnumber',
                      style: TextStyle(fontSize: 15, color: Colors.grey.shade500)),
                  const TextSpan(
                    text: ' +0 000 000 0000',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlueAccent,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 64,
              width: 245,
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                controller: _otpController,
                keyboardType: TextInputType.number,
                obscureText: true,
                obscuringCharacter: '*',
                cursorColor: Colors.lightBlueAccent,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeFillColor: Colors.lightBlueAccent,
                  inactiveColor: Colors.grey,
                  selectedColor: Colors.lightBlueAccent,
                  inactiveFillColor: Colors.grey,
                  activeColor: Colors.lightBlueAccent,
                  selectedFillColor: Colors.lightBlueAccent,
                ),
              ),
            ),
            const SizedBox(height: 15),
            BigText(
                text: _canResend
                    ? "00:00"
                    : "00:${_secondsRemaining.toString().padLeft(2, '0')}",
                size: 16,
                color: Colors.black),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Didn’t get an OTP?', style: TextStyle(fontSize: 15)),
                TextButton(
                  onPressed: _canResend ? resendOTP : null, // 🚀 صرف ٹائمر ختم ہونے کے بعد فعال ہوگا
                  child: Text(
                    'Resend',
                    style: TextStyle(
                      fontSize: 15,
                      color: _canResend ? Colors.lightBlueAccent : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: _isSubmitting ? null : verifyOTP,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: SizedBox(
                height: 40,
                width: screenSize.width - 90,
                child: Center(
                  child: _isSubmitting
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('SUBMIT',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import 'BigText.dart';
// import 'Page21.dart';
//
// class Page5 extends StatefulWidget {
//   final String email;
//
//   // final Map<String, dynamic>? data;
//   const Page5({super.key, required this.email,});
//
//   @override State<Page5> createState() => _Page5State();
// }
// class _Page5State extends State<Page5> {
//   final TextEditingController _otpController = TextEditingController();
//
//   final TextEditingController email = TextEditingController();
//   bool _isSubmitting = false;
//
//
//   Future<void> verifyOTP() async {
//     const String apiUrl = "https://Nda.yourailist.com/api/verify";
//     final String otp = _otpController.text;
//
//
//     if (otp.isEmpty || otp.length != 4) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter a valid 4-digit OTP.')),
//       );
//       return;
//     }
//
//     setState(() {
//       _isSubmitting = true;
//     });
//
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: json.encode(
//           {'otp': otp,'email': widget.email},
//
//         ),
//       );
//
//       if (response.statusCode == 200) {
//         print(response.body);
//         final aresponseData = json.decode(response.body);
//
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const Page21()),
//         );
//       } else {
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Failed to verify OTP. Please try again.')),
//         );
//       }
//     } catch (error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An error occurred: $error')),
//       );
//     } finally {
//       setState(() {
//         _isSubmitting = false;
//       });
//     }
//   }
//
//   Future<void> ResentyOTP() async {
//     try {
//       final response = await http.post(
//         Uri.parse('https://nda.qaadvance.com/api/resendOTP'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: json.encode({
//           'email': widget.email, // Correctly pass the email here
//         }),
//       );
//
//       if (response.statusCode == 200) {
//         print(response.body);
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('OTP resent successfully.')),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Failed to resend OTP. Please try again.')),
//         );
//       }
//     } catch (error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An error occurred: $error')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 50),
//                   child: IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: const Icon(
//                       Icons.navigate_before,
//                       color: Colors.black,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 25),
//             Center(
//               child: SizedBox(
//                 height: 230,
//                 width: screenSize.width - 60,
//                 child: SvgPicture.asset(
//                   'assets/otp verification pic.svg', // Path to your SVG file
//                   fit: BoxFit.contain, // Adjust the fit as needed
//                 ),
//               ),
//             ),
//             const SizedBox(height: 15),
//             BigText(text: 'OTP Verification', size: 25, color: Colors.black),
//             const SizedBox(height: 10),
//             RichText(
//               text: TextSpan(
//                 style: const TextStyle(
//                   fontSize: 12,
//                   color: Colors.black,
//                 ),
//                 children: <TextSpan>[
//                   TextSpan(
//                       text: 'We have sent you a 4-digit code to your',
//                       style: TextStyle(fontSize: 15, color: Colors.grey.shade500)),
//                   TextSpan(
//                       text: '\n\t\t\t\t\t\t\t\t\t\t\t\tnumber',
//                       style: TextStyle(fontSize: 15, color: Colors.grey.shade500)),
//                   const TextSpan(
//                     text: ' +0 000 000 0000',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.lightBlueAccent,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               height: 64,
//               width: 245,
//               child: PinCodeTextField(
//                 appContext: context,
//                 length: 4,
//                 controller: _otpController,
//                 keyboardType: TextInputType.number,
//                 obscureText: true,
//                 obscuringCharacter: '*',
//                 cursorColor: Colors.lightBlueAccent,
//                 pinTheme: PinTheme(
//                   shape: PinCodeFieldShape.box,
//                   borderRadius: BorderRadius.circular(10),
//                   fieldHeight: 50,
//                   fieldWidth: 50,
//                   activeFillColor: Colors.lightBlueAccent,
//                   inactiveColor: Colors.grey,
//                   selectedColor: Colors.lightBlueAccent,
//                   inactiveFillColor: Colors.grey,
//                   activeColor: Colors.lightBlueAccent,
//                   selectedFillColor: Colors.lightBlueAccent,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 15),
//             BigText(text: '00:30', size: 16, color: Colors.black),
//             const SizedBox(height: 15),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text('Didn’t got an OTP?', style: TextStyle(fontSize: 15)),
//
//                 TextButton(
//                   onPressed:ResentyOTP,
//                   child: const Text('Resend', style: TextStyle(fontSize: 15)),
//                 ),
//               ],
//             ),
//
//
//             const SizedBox(height: 50),
//             TextButton(
//               onPressed: _isSubmitting ? null : verifyOTP,
//               style: ButtonStyle(
//                 backgroundColor: WidgetStateProperty.all<Color>(
//                     Colors.lightBlueAccent), // Background color
//                 shape: WidgetStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                 ),
//               ),
//               child: SizedBox(
//                 height: 40,
//                 width: screenSize.width - 90,
//                 child: Center(
//                   child: _isSubmitting
//                       ? const CircularProgressIndicator(color: Colors.white)
//                       : const Text('SUBMIT',
//                       style: TextStyle(fontSize: 16, color: Colors.white)),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//

























// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import 'BigText.dart';
// import 'Page21.dart';
//
// class Page5 extends StatefulWidget {
//   final String email;
//
//  // final Map<String, dynamic>? data;
//    const Page5({super.key, required this.email,});
//
//   @override State<Page5> createState() => _Page5State();
// }
// class _Page5State extends State<Page5> {
//   final TextEditingController _otpController = TextEditingController();
//
//   final TextEditingController email = TextEditingController();
//   bool _isSubmitting = false;
//
//
//   Future<void> verifyOTP() async {
//     const String apiUrl = "https://nda.qaadvance.com/api/verify";
//     final String otp = _otpController.text;
//
//
//     if (otp.isEmpty || otp.length != 4) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter a valid 4-digit OTP.')),
//       );
//       return;
//     }
//
//     setState(() {
//       _isSubmitting = true;
//     });
//
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: json.encode(
//           {'otp': otp,'email': widget.email},
//
//         ),
//
//       );
//
//       if (response.statusCode == 200) {
//         print(response.body);
//         final responseData = json.decode(response.body);
//
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const Page21()),
//         );
//
//       } else {
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Failed to verify OTP. Please try again.')),
//         );
//       }
//     } catch (error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An error occurred: $error')),
//       );
//     } finally {
//       setState(() {
//         _isSubmitting = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 50),
//                   child: IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: const Icon(
//                       Icons.navigate_before,
//                       color: Colors.black,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 25),
//             Center(
//               child: SizedBox(
//                 height: 230,
//                 width: screenSize.width - 60,
//                 child: SvgPicture.asset(
//                   'assets/otp verification pic.svg', // Path to your SVG file
//                   fit: BoxFit.contain, // Adjust the fit as needed
//                 ),
//               ),
//             ),
//             const SizedBox(height: 15),
//             BigText(text: 'OTP Verification', size: 25, color: Colors.black),
//             const SizedBox(height: 10),
//             RichText(
//               text: TextSpan(
//                 style: const TextStyle(
//                   fontSize: 12,
//                   color: Colors.black,
//                 ),
//                 children: <TextSpan>[
//                   TextSpan(
//                       text: 'We have sent you a 4-digit code to your',
//                       style: TextStyle(fontSize: 15, color: Colors.grey.shade500)),
//                   TextSpan(
//                       text: '\n\t\t\t\t\t\t\t\t\t\t\t\tnumber',
//                       style: TextStyle(fontSize: 15, color: Colors.grey.shade500)),
//                   const TextSpan(
//                     text: ' +0 000 000 0000',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.lightBlueAccent,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               height: 64,
//               width: 245,
//               child: PinCodeTextField(
//                 appContext: context,
//                 length: 4,
//                 controller: _otpController,
//                 keyboardType: TextInputType.number,
//                 obscureText: true,
//                 obscuringCharacter: '*',
//                 cursorColor: Colors.lightBlueAccent,
//                 pinTheme: PinTheme(
//                   shape: PinCodeFieldShape.box,
//                   borderRadius: BorderRadius.circular(10),
//                   fieldHeight: 50,
//                   fieldWidth: 50,
//                   activeFillColor: Colors.lightBlueAccent,
//                   inactiveColor: Colors.grey,
//                   selectedColor: Colors.lightBlueAccent,
//                   inactiveFillColor: Colors.grey,
//                   activeColor: Colors.lightBlueAccent,
//                   selectedFillColor: Colors.lightBlueAccent,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 15),
//             BigText(text: '00:30', size: 16, color: Colors.black),
//             const SizedBox(height: 15),
//             RichText(
//               text: TextSpan(
//                 style: const TextStyle(
//                   fontSize: 15,
//                   color: Colors.black,
//                 ),
//                 children: <TextSpan>[
//                   TextSpan(
//                       text: "Didn't got an OTP?",
//                       style: TextStyle(color: Colors.grey.shade500)),
//                   const TextSpan(
//                     text: ' Resend',
//                     style: TextStyle(
//                       color: Colors.lightBlueAccent,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 50),
//             TextButton(
//               onPressed: _isSubmitting ? null : verifyOTP,
//               style: ButtonStyle(
//                 backgroundColor: WidgetStateProperty.all<Color>(
//                     Colors.lightBlueAccent), // Background color
//                 shape: WidgetStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                 ),
//               ),
//               child: SizedBox(
//                 height: 40,
//                 width: screenSize.width - 90,
//                 child: Center(
//                   child: _isSubmitting
//                       ? const CircularProgressIndicator(color: Colors.white)
//                       : const Text('SUBMIT',
//                       style: TextStyle(fontSize: 16, color: Colors.white)),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
// }
// // import 'package:flutter/material.dart';
// // import 'package:flutter_svg/svg.dart';
// // import 'package:pin_code_fields/pin_code_fields.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// //
// // import 'BigText.dart';
// // import 'Page21.dart';
// //
// // class Page5 extends StatefulWidget {
// //    // Store additional data like email
// //   const  {super.key; this.data;});
// //
// //   @override
// //   State<Page5> createState() => _Page5State();
// // }
// //
// // class _Page5State extends State<Page5> {
// //   final TextEditingController _otpController = TextEditingController();
// //   bool _isSubmitting = false;
// //
// //   Future<void> verifyOTP() async {
// //     const String apiUrl = "https://nda.qaadvance.com/api/verify";
// //     final String otp = _otpController.text;
// //
// //     // Retrieve email from widget's data map
// //     final String? email = widget.data?['email'];
// //
// //     if (otp.isEmpty || otp.length != 4) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('Please enter a valid 4-digit OTP.')),
// //       );
// //       return;
// //     }
// //
// //     setState(() {
// //       _isSubmitting = true;
// //     });
// //
// //     try {
// //       final response = await http.post(
// //         Uri.parse(apiUrl),
// //         headers: {
// //           'Content-Type': 'application/json',
// //         },
// //         body: json.encode({'otp': otp, 'email': email}),
// //       );
// //
// //       if (response.statusCode == 200) {
// //         print(response.body);
// //         final responseData = json.decode(response.body);
// //
// //         // Navigate to the next page and pass the response data if needed
// //         Navigator.pushReplacement(
// //           context,
// //           MaterialPageRoute(builder: (context) => const Page21()),
// //         );
// //       } else {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           const SnackBar(content: Text('Failed to verify OTP. Please try again.')),
// //         );
// //       }
// //     } catch (error) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('An error occurred: $error')),
// //       );
// //     } finally {
// //       setState(() {
// //         _isSubmitting = false;
// //       });
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     Size screenSize = MediaQuery.of(context).size;
// //
// //     // Retrieve email from widget's data map
// //     final String? email = widget.data?['email'] ?? '+0 000 000 0000';
// //
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: SingleChildScrollView(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           children: [
// //             Row(
// //               children: [
// //                 Padding(
// //                   padding: const EdgeInsets.only(top: 50),
// //                   child: IconButton(
// //                     onPressed: () {
// //                       Navigator.pop(context);
// //                     },
// //                     icon: const Icon(
// //                       Icons.navigate_before,
// //                       color: Colors.black,
// //                       size: 30,
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 25),
// //             Center(
// //               child: SizedBox(
// //                 height: 230,
// //                 width: screenSize.width - 60,
// //                 child: SvgPicture.asset(
// //                   'assets/otp verification pic.svg',
// //                   fit: BoxFit.contain,
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 15),
// //             BigText(text: 'OTP Verification', size: 25, color: Colors.black),
// //             const SizedBox(height: 10),
// //             RichText(
// //               text: TextSpan(
// //                 style: const TextStyle(fontSize: 12, color: Colors.black),
// //                 children: <TextSpan>[
// //                   TextSpan(
// //                     text: 'We have sent you a 4-digit code to your ',
// //                     style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
// //                   ),
// //                   TextSpan(
// //                     text: email,
// //                     style: const TextStyle(
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.lightBlueAccent,
// //                       fontSize: 15,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             SizedBox(
// //               height: 64,
// //               width: 245,
// //               child: PinCodeTextField(
// //                 appContext: context,
// //                 length: 4,
// //                 controller: _otpController,
// //                 keyboardType: TextInputType.number,
// //                 obscureText: true,
// //                 obscuringCharacter: '*',
// //                 cursorColor: Colors.lightBlueAccent,
// //                 pinTheme: PinTheme(
// //                   shape: PinCodeFieldShape.box,
// //                   borderRadius: BorderRadius.circular(10),
// //                   fieldHeight: 50,
// //                   fieldWidth: 50,
// //                   activeFillColor: Colors.lightBlueAccent,
// //                   inactiveColor: Colors.grey,
// //                   selectedColor: Colors.lightBlueAccent,
// //                   inactiveFillColor: Colors.grey,
// //                   activeColor: Colors.lightBlueAccent,
// //                   selectedFillColor: Colors.lightBlueAccent,
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 15),
// //             BigText(text: '00:30', size: 16, color: Colors.black),
// //             const SizedBox(height: 15),
// //             RichText(
// //               text: TextSpan(
// //                 style: const TextStyle(fontSize: 15, color: Colors.black),
// //                 children: <TextSpan>[
// //                   TextSpan(
// //                     text: "Didn't get an OTP? ",
// //                     style: TextStyle(color: Colors.grey.shade500),
// //                   ),
// //                   const TextSpan(
// //                     text: 'Resend',
// //                     style: TextStyle(
// //                       color: Colors.lightBlueAccent,
// //                       fontWeight: FontWeight.bold,
// //                       fontSize: 15,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             const SizedBox(height: 50),
// //             TextButton(
// //               onPressed: _isSubmitting ? null : verifyOTP,
// //               style: ButtonStyle(
// //                 backgroundColor: MaterialStateProperty.all<Color>(
// //                     Colors.lightBlueAccent),
// //                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
// //                   RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(30.0),
// //                   ),
// //                 ),
// //               ),
// //               child: SizedBox(
// //                 height: 40,
// //                 width: screenSize.width - 90,
// //                 child: Center(
// //                   child: _isSubmitting
// //                       ? const CircularProgressIndicator(color: Colors.white)
// //                       : const Text(
// //                     'SUBMIT',
// //                     style: TextStyle(fontSize: 16, color: Colors.white),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
