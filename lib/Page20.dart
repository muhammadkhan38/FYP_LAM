import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Page21.dart';

class Page20 extends StatelessWidget {
  const Page20({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
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
              const SizedBox(height: 100,),
              SizedBox(
                width: 180,
                  height: 180,
                child: SvgPicture.asset('assets/check.svg')
              ),
              const SizedBox(height: 40,),
              const Text('Your details have been',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black),),
              const Text('submitted for approval',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black),),
              const SizedBox(height: 20,),
              const Text('Your details have been submitted for the',style: TextStyle(fontSize: 14),),
              const Text('approval it may take our team a few days',style: TextStyle(fontSize: 14),),
              const Text('to go through your details and approve',style: TextStyle(fontSize: 14),),
              const Text('you account.',style: TextStyle(fontSize: 14),),
        
              const SizedBox(height: 60,),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Page21(),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFF00C2FF),), // Background color
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                child: const SizedBox(
                    height: 40,
                    width: 230,
                    child: Center(
                      child: Text("Done",
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
