import 'package:flutter/material.dart';

import 'BigText.dart';
import 'Page9.dart';
import 'SmallText.dart';
class Page8 extends StatelessWidget {
  const Page8({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
                  const SizedBox(width: 20,),
                  const Text('Choose your Document',style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),),
                ],
              ),
              const SizedBox(height: 30,),
              Container(
                height: 70,
                width: screenSize.width-30,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black12, // Border color
                    width: 0.5, // Border width
                  ),
                ),
                child: Center(
                  child: ListTile(
                    leading: const Icon(Icons.error,color: Color(0xFF00C2FF),),
                    title: SmallText(text: 'In the next step, you will record the',size: 14,),
                    subtitle: BigText(text: 'original document',size: 14,color: Colors.black,),
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              Container(
                width: screenSize.width-40,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.contact_mail_rounded,color: Color(0xFF00C2FF),),
                      title: Text('National ID card',style: TextStyle(fontSize: 14,color: Colors.black,),),
                      trailing: Icon(Icons.navigate_next,color: Colors.black,),
                    ),
                    Divider(color: Colors.black,height: 5,indent: 15,endIndent: 15),
                    ListTile(
                      leading: Icon(Icons.contact_mail_rounded,color: Color(0xFF00C2FF),),
                      title: Text('Passport',style: TextStyle(fontSize: 14,color: Colors.black,),),
                      trailing: Icon(Icons.navigate_next,color: Colors.black,),
                    ),
                    Divider(color: Colors.black,height: 5,indent: 15,endIndent: 15),
                    ListTile(
                      leading: Icon(Icons.contact_mail_rounded,color: Color(0xFF00C2FF),),
                      title: Text('Driving licence',style: TextStyle(fontSize: 14,color: Colors.black,),),
                      trailing: Icon(Icons.navigate_next,color: Colors.black,),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50,),
              const Padding(
                padding: EdgeInsets.only(right: 100),
                child: Text('Select the issuing country',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 20,
              ),
              Container(
                width: screenSize.width-40,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: const ListTile(
                  leading: Icon(Icons.flag, color: Color(0xFF00C2FF),),
                  title:  Text('United States',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  trailing: Icon(Icons.navigate_next,color: Colors.black,),

                ),
              ),
              const SizedBox(height: 40,),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Page9(),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFF00C2FF)), // Background color
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
                      child: Text('Continue verifying',
                          style: TextStyle(color: Colors.white,fontSize: 16)),
                    )), // Text style
              ),
            ],
          ),
        ),
      ),
    );
  }
}
