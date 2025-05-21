import 'package:flutter/material.dart';

import 'Page15.dart';


class Page14 extends StatelessWidget {
  const Page14({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
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
                      )),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            const Text('Successful!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.black),),
            const SizedBox(height: 50,),
            const Image(image: AssetImage('assets/page14pic.png')),
            const SizedBox(height: 50,),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Page15(),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  Color(0xFF00C2FF),), // Background color
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
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
                    child: Text("Continue",
                        style: TextStyle(color: Colors.white)),
                  )), // Text style
            ),
          ],
        ),
      ),
    );
  }
}
