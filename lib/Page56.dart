import 'package:flutter/material.dart';

import 'Page6.dart';

class Page56 extends StatefulWidget {
  const Page56({super.key});

  @override
  State<Page56> createState() => _Page56State();

}

class _Page56State extends State<Page56> {
  bool isYearly = false;
  @override
  Widget build(BuildContext context) {
    Size screenSize =MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 494,
                  width: screenSize.width,
                  color: Colors.black87,
                  child:  Column(
                      children: [
                        SizedBox(height: 60,),
                        Row(
                          children: [
                            IconButton(onPressed: (){Navigator.pop(context);},
                                icon: Icon(Icons.arrow_back_ios_new,size: 20,color: Colors.white,)),
                            Padding(
                              padding: const EdgeInsets.only(left: 80),
                              child: Text('Membership',
                                style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 75),
                              child: Text('Monthly', style: TextStyle(color: Colors.white)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Transform.scale(
                                scaleX: 1.5,
                                scaleY: 1.5,
                                child: Switch(
                                  inactiveTrackColor: Colors.white,
                                  value: isYearly,
                                  onChanged: (value) {
                                    setState(() {
                                      isYearly = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text('Yearly', style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ]
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 220,),
                  child: Center(
                    child: Container(
                      height: 360,
                     width: screenSize.width-5,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 180,top: 15),
                            child: ElevatedButton(
                            onPressed: () {
                                                  // Perform action when the button is pressed
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text("Button Pressed!")),
                                              );
                                            },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white, // Button background color
                                                foregroundColor: Colors.black, // Text color
                                                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                                                textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50), // Rounded corners
                                                ),
                                                elevation: 9, // Shadow effect
                                              ),
                                              child: Text("MOST POPULAR"),
                                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: RichText(
                              text: TextSpan(
                                text: "\$15",
                                style: TextStyle(fontSize: 32, color: Colors.white,fontWeight: FontWeight.w800), // Default style
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '/month',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, color: Colors.white,fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text("Enterprise", style: TextStyle(fontSize: 32, color: Colors.white,fontWeight: FontWeight.w600), // Default style
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: RichText(
                              text: TextSpan(
                                text: "Unlimited",
                                style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.w600), // Default style
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' Agreement',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400, color: Colors.white,fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text("Lorem Ipsum is simply dummy text of the printing.", style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.w500), // Default style
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

  Widget buildPlanCard({
    required String title,
    required String price,
    required String description,
    required String agreements,
    bool isPopular = false,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isPopular ? Colors.blueAccent : Colors.grey[800],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isPopular)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'MOST POPULAR',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            SizedBox(height: 10),
            Text(
              price,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            Spacer(),
            Text(
              agreements,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blueAccent, backgroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Choose plan'),
            ),
          ],
        ),
      ),
    );
  }
