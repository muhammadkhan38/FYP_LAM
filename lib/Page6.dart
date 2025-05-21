import 'package:flutter/material.dart';

import 'Page7.dart';


class Page6 extends StatelessWidget {
  const Page6({super.key});

  @override
  Widget build(BuildContext context)

  {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      SingleChildScrollView(
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
                      )
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: screenSize.width-40,
                  height: 240,
                  child: const Image(image: AssetImage('assets/page6pic.png')),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            const Text('Verifying your identify',style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Text('We need to check that you are who you say you',style: TextStyle(fontSize: 14,color: Colors.grey.shade400),),
            Text("are.Here's how it works.",style: TextStyle(fontSize: 14,color: Colors.grey.shade400),),
            const SizedBox(height: 20,),
            Container(
              width: screenSize.width-40,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: ListTile(
                  leading: Icon(Icons.person, color: Color(0xFF00C2FF),size: 25),
                  title:  Text('Take a picture of a valid photo ID',style: TextStyle(fontSize: 14,color: Color(0xFF00C2FF),fontWeight: FontWeight.bold),),
                  subtitle: Text('To check your personal information is correct.',style: TextStyle(fontSize: 12,color: Colors.black),),
                ),
              ),
            ),
            const SizedBox(height: 20,),

            Container(
              width: screenSize.width-40,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
              ),

              child: const Center(
                child: ListTile(
                  leading: Icon(Icons.camera_alt, color: Color(0xFF00C2FF),size: 25),
                  title: Text('Record a short video of yourself',style: TextStyle(fontSize: 14,color: Color(0xFF00C2FF),fontWeight: FontWeight.bold),),
                  subtitle:  Text('To mach your face to your ID photo.',style: TextStyle(fontSize: 12,color: Colors.black,),),
                ),
              ),
            ),
            const SizedBox(height: 50,),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Page7(),
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
                    child: Text('Get Started',
                        style: TextStyle(color: Colors.white,fontSize: 16),),
                  )), // Text style
            ),
          ],
        ),
      ),
    );
  }
}
