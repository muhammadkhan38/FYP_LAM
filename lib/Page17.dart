import 'package:flutter/material.dart';

import 'Page18.dart';


class Page17 extends StatelessWidget {
  const Page17({super.key});

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
            const Text('Successful!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black),),
            const SizedBox(height: 50,),
            const Image(image: AssetImage('assets/page15pic.png')),
            const SizedBox(height: 50,),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Page18(),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.lightBlueAccent,), // Background color
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(30.0),
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
