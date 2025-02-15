import 'package:flutter/material.dart';

import 'Page20.dart';


class Page18 extends StatelessWidget {
  const Page18({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text('Record a short video of\n\t\t\t\t\t\t\t\t\t\t\tYourself',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.black),),
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              const Text(
                'Find a well lit area and say a few words',
              ),
              const Text(
                'to camera so we can clearly match your',
              ),
              const Text(
                'face to your Photo ID.',
              ),
              const SizedBox(
                height: 20,
              ),
               SizedBox(
                width: screenSize.width-30,
                height: 310,
                child: const Image(image: AssetImage('assets/page18pic.png')),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: screenSize.width-30,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.lightBlue.shade100,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: Colors.lightBlueAccent,
                  ),
                  title: Text(
                    "The video will be encrypted, stored\nsecurity, and only ever used to verify your\nidentity",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Page20(),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.lightBlueAccent,
                  ), // Background color
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      // Border radius
                    ),
                  ),
                ),
                child:  SizedBox(
                    height: 40,
                    width: screenSize.width-90,
                    child: const Center(
                      child: Text("i'm ready to record a video",
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
