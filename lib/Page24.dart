import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Drawer_Class.dart';
import 'Page17.dart';
import 'Page21.dart';
import 'Page22.dart';
import 'Page23.dart';
import 'Page41.dart';
class Page24 extends StatelessWidget {
  const Page24({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return  Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:    const Text(
          'Documents',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),titleSpacing: 90,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, // Set the color for the drawer icon
        ),
      ),
        drawer: const DrawerClass(),
        backgroundColor: Colors.grey.shade100,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(topRight: Radius.circular(30),topLeft:Radius.circular(30)),
          child: BottomAppBar(
            height: 70,
            color: Colors.black87,
            notchMargin: 8,
            elevation: 40,
            shape: const CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>  const Page21()));
                  },
                  icon: const Icon(CupertinoIcons.house_alt),splashColor: Colors.lightBlue,
                  color: Colors.lightBlueAccent,
                ),
                IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>  const Page23()));
                  },
                  icon: const Icon(CupertinoIcons.doc_text),splashColor: Colors.lightBlue,
                  color: Colors.lightBlueAccent,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>  const Page22()));
                  },
                  icon: const Icon(CupertinoIcons.bookmark),splashColor: Colors.lightBlue,
                  color: Colors.lightBlueAccent,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>  const Page41()));
                  },
                  icon: const Icon(CupertinoIcons.person),splashColor: Colors.lightBlue,
                  color: Colors.lightBlueAccent,
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
             Center(
               child: Container(
                 height: 55,
                 width: screenSize.width-30,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(40),
                 ),
                 child: Row(
                   children: [
                     const SizedBox(width: 5,),
                     TextButton(
                       onPressed: () => Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => const Page17(),
                         ),
                       ),
                       style: ButtonStyle(
                         backgroundColor: WidgetStateProperty.all<Color>(
                           Colors.white,), // Background color
                         shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                           RoundedRectangleBorder(
                             borderRadius:
                             BorderRadius.circular(30.0),
                           ),
                         ),
                       ),
                       child:  SizedBox(
                           height: 30,
                           width: screenSize.width-180,
                           child: const Center(
                             child: Text("My Agreement",
                                 style: TextStyle(color: Colors.black)),
                           )), // Text style
                     ),
                      const SizedBox(width: 50,),
                      const Text('My Draft',style: TextStyle(color: Colors.black),
                     ),
                   ],
                 ),
               ),
             ),
              const SizedBox(height: 10,),
              Container(
                width: screenSize.width-10,
                height: 101,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                   Row(
                    children: [
                      const SizedBox(width: 10,),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text('Lorem Name',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,fontFamily: "Inter"),),
                          SizedBox(height: 10,),
                          Text('Lorem Ipsum Agreement Title',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),),
                          SizedBox(height: 5,),
                          Text('Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.',style: TextStyle(fontSize: 11,),),
                        ],
                      ),
                      const SizedBox(width: 25,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           const Padding(
                             padding: EdgeInsets.only(left: 55,top: 10),
                             child: Icon(Icons.more_vert),
                           ),
                           const SizedBox(height: 5,),
                          SizedBox(
                            height: 27,
                            width: 76,
                            child: TextButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  const Page17(),
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Colors.black54,),
                                // Background color
                                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(30.0),

                                    // Border radius
                                  ),
                                ),
                              ),
                              child:  const Text("Resume",
                                  style: TextStyle(color: Colors.white,fontSize: 12)), // Text style
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 10,),
              Container(
                width: screenSize.width-10,
                height: 101,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                Row(
                  children: [
                    const SizedBox(width: 10,),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text('Lorem Name',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,fontFamily: "Inter"),),
                        SizedBox(height: 10,),
                        Text('Lorem Ipsum Agreement Title',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),),
                        SizedBox(height: 5,),
                        Text('Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry.',style: TextStyle(fontSize: 11,),),
                      ],
                    ),
                    const SizedBox(width: 25,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 53,top: 10),
                          child: Icon(Icons.more_vert),
                        ),
                        const SizedBox(height: 5,),
                        SizedBox(
                          height: 27,
                          width: 76,
                          child: TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  const Page17(),
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                Colors.black54,), // Background color
                              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            child:  const Text("Resume",
                                style: TextStyle(color: Colors.white,fontSize: 12)), // Text style
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: screenSize.width-10,
                height: 101,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                Row(
                  children: [
                    const SizedBox(width: 10,),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text('Lorem Name',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,fontFamily: "Inter"),),
                        SizedBox(height: 10,),
                        Text('Lorem Ipsum Agreement Title',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),),
                        SizedBox(height: 5,),
                        Text('Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.',style: TextStyle(fontSize: 11,),),
                      ],
                    ),
                    const SizedBox(width: 25,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 55,top: 10),
                          child: Icon(Icons.more_vert),
                        ),
                        const SizedBox(height: 5,),
                        SizedBox(
                          height: 27,
                          width: 76,
                          child: TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  const Page17(),
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                Colors.black54,), // Background color
                              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(30.0),
                                  // Border radius
                                ),
                              ),
                            ),
                            child:  const Text("Resume",
                                style: TextStyle(color: Colors.white,fontSize: 12)), // Text style
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: screenSize.width-10,
                height: 101,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                Row(
                  children: [
                    const SizedBox(width: 10,),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text('Lorem Name',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,fontFamily: "Inter"),),
                        SizedBox(height: 10,),
                        Text('Lorem Ipsum Agreement Title',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),),
                        SizedBox(height: 5,),
                        Text('Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.',style: TextStyle(fontSize: 11,),),
                      ],
                    ),
                    const SizedBox(width: 25,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 55,top: 10),
                          child: Icon(Icons.more_vert),
                        ),
                        const SizedBox(height: 5,),
                        SizedBox(
                          height: 27,
                          width: 76,
                          child: TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  const Page17(),
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.black54,), // Background color
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            child:  const Text("Resume",
                                style: TextStyle(color: Colors.white,fontSize: 12)), // Text style
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
