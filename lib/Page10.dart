import 'package:flutter/material.dart';
import 'Page12.dart';
class Page10 extends StatelessWidget {
  const Page10({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 80,),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.navigate_before,
                        color: Colors.black,
                        size: 30,
                      )),
                  const Text('Get ready to hold and tilt the\n\t\t\t\t\tfront of your document',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black),),
                ],
              ),
              const SizedBox(height: 30,),
              const Text('This lets us detect hlograms and'),
              const Text('Security marks'),
              const SizedBox(height: 50,),
              const Image(image: AssetImage('assets/page9pic.png')),
              const SizedBox(height: 50,),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Page12(),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFF00C2FF),), // Background color
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(30.0),
                      // Border radius
                    ),
                  ),
                ),
                child:  SizedBox(
                    height: 40,
                    width: screenSize.width-90,
                    child: const Center(
                      child: Text("i'm ready to tilt my document",
                          style: TextStyle(color: Colors.white)),
                    )), // Text style
              ),
            ],
          ),
        ),
      ),
    );
  }
}
