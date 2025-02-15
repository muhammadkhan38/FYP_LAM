import 'package:flutter/material.dart';
import 'Page10.dart';

class Page9 extends StatelessWidget {
  const Page9({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  const Text('Document selection',style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
                ],
              ),
              const SizedBox(height: 30,),
               Text('This document has been pre-selected.',style: TextStyle(fontSize: 14,color: Colors.grey.shade600),),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('To modify it,',style: TextStyle(fontSize: 14,color: Colors.grey.shade600),),
                  const Text('Click here',style: TextStyle(fontSize: 14,color: Colors.lightBlueAccent,fontWeight: FontWeight.bold),),
                ],
              ),
              const SizedBox(height: 40,),
              const Padding(
                padding: EdgeInsets.only(right: 160),
                child: Text('Your document',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 20,bottom: 20,left: 50),
                child: Row(
                  children: [
                    Icon(Icons.date_range,color: Colors.lightBlueAccent,),
                    SizedBox(width: 20,),
                    Text('National ID Card',style: TextStyle(fontSize: 14,color: Colors.black),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50,right: 30),
                child: Divider(height: 2,color: Colors.grey.shade400),
              ),
              const SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.only(right: 50),
                child: Text('Country of issue of the document',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 45,top: 20,bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.flag,color: Colors.lightBlueAccent,),
                    SizedBox(height: 20,),
                    Text('United States',style: TextStyle(fontSize: 14,color: Colors.black),),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 50,right: 30),
                child: Divider(height: 2,color: Colors.grey.shade400),
              ),
              const SizedBox(height: 70,),
              Container(
                width: screenSize.width-30,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.blueAccent, // Border color
                    width: 0.5, // Border width
                  ),
                ),
                child: const ListTile(
                  leading: Icon(Icons.error,color: Colors.lightBlueAccent,),
                  title:   Text('In the next step, you will record the',style: TextStyle(fontSize: 14,color: Colors.black),),
                  subtitle: Text('original document',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.w600),),
                ),
              ),
              const SizedBox(height: 30,),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Page10(),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.lightBlueAccent), // Background color
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
              const SizedBox(height: 40,),
              const Text("I don't have the original document",style: TextStyle(fontSize: 14,color: Colors.black,decoration: TextDecoration.underline,fontWeight: FontWeight.w500,),),
            ],
          ),
        ),
      ),

    );
  }
}
