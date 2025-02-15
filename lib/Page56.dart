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
                  width: 430,
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
                  padding: const EdgeInsets.only(top: 220,left: 30),
                  child: Container(
                    height: 360,
                    width: screenSize.width-60,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:

                    Column(
                      children: [
                        TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Page6(),
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.lightBlueAccent), // Background color
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
                                child: Text('SUBMIT',
                                    style: TextStyle(fontSize:16,color: Colors.white)),
                              )), // Text style
                        ),
                      ],
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
