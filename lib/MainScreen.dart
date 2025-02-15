import 'package:final_year_project/page3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import 'Page4.dart';
import 'SmallText.dart';

class MainScreen extends StatelessWidget {

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/background image.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
               Padding(
                padding:
                     const EdgeInsets.only(top: 140,),
                child: SizedBox(
                  height: 164.38,
                  width: screenSize.width - 208,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/nda logo image.svg', // Path to your SVG file
                      fit: BoxFit.contain, // Adjust the fit as needed
                    ),
                  ),
                ),

               ),
              Padding(
                padding:  const EdgeInsets.only(top: 20),
                child: Center(
                  child: SmallText(
                      text:
                          'Lorem ipsum is simply dummy text of the \n       printing and typesetting industry.',
                      size: 14,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 240,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Page4(),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          Colors.white), // Background color
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(30.0), // Border radius
                        ),
                      ),
                    ),
                    child:  SizedBox(
                        height: 40,
                        width: screenSize.width/2-35,
                        child: const Center(
                          child: Text('SIGN UP',
                              style: TextStyle(fontSize: 16,color: Colors.lightBlueAccent),),
                        )), // Text style
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Page3(),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          Colors.lightBlueAccent), // Background color
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30.0), // Border radius
                        ),
                      ),
                    ),
                    child:  SizedBox(
                        height: 40,
                        width: screenSize.width/2-35,
                        child: const Center(
                          child: Text('LOGIN',
                              style: TextStyle(fontSize: 16,color: Colors.white)),
                        )), // Text style
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
