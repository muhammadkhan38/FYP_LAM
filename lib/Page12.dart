import 'package:flutter/material.dart';

import 'Page14.dart';

class Page12 extends StatelessWidget {
  const Page12({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
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
                  const Text('Get ready to hold the front\n\t\t\t\t\t\t\tof your document',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black),),
                ],
              ),
              const SizedBox(height: 30,),
              const Text('This lets us detect holograms and'),
              const Text('Security marks'),
              const SizedBox(height: 50,),
              const Image(image: AssetImage('assets/page12pic.png')),
              const SizedBox(height: 50,),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Page14(),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                   Colors.lightBlueAccent,), // Background color
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
                      child: Text("i'm ready for front Image",
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
