import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Page8.dart';


class Page7 extends StatelessWidget {
  const Page7({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50,),
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
                const SizedBox(width: 70,),
                Text('Verify your identity',style: TextStyle(fontSize: 20,color: Colors.grey.shade700,fontWeight: FontWeight.w500),),
              ],
            ),
            const Center(
              child: SizedBox(
                  height: 200,
                  width: 320,
                  child: Image(image: AssetImage('assets/page7pic.png',))),
            ),
            const SizedBox(height: 20,),
            const Text('Take a picture of a valid',style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),),
            const Text('photo ID',style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Text('Like your passport,driving license, or national',style: TextStyle(fontSize: 14,color: Colors.grey.shade700,),),
            Text('ID card checking that:',style: TextStyle(fontSize: 14,color: Colors.grey.shade700,),),
            const SizedBox(height: 25,),
            Center(
              child: Container(
                width: screenSize.width-40,
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: const Column(
                  children: [
                    ListTile(
                      leading: Icon(CupertinoIcons.checkmark_alt,color: Colors.lightBlueAccent,), // Example of a leading icon
                      title: Text("it hasn't expired",style: TextStyle(fontSize: 14,color: Colors.black,),),
                    ),
                    Divider(color: Colors.grey,height: 5,indent: 15,endIndent: 15),
                    ListTile(
                      leading: Icon(CupertinoIcons.checkmark_alt,color: Colors.lightBlueAccent,), // Example of a leading icon
                      title: Text("it's clear and essy to read",style: TextStyle(fontSize: 14,color: Colors.black),),
                    ),
                    Divider(color: Colors.grey,height: 5,indent: 15,endIndent: 15),
                    ListTile(
                      leading: Icon(CupertinoIcons.checkmark_alt,color: Colors.lightBlueAccent,), // Example of a leading icon
                      title: Text("the whole ID is in the picture",style: TextStyle(fontSize: 14,color: Colors.black),),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Page8(),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                    Colors.lightBlueAccent), // Background color
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
                    child: Text('Get Started',
                        style: TextStyle(color: Colors.white,fontSize: 16)),
                  )), // Text style
            ),
          ],
        ),
      ),
    );
  }
}
