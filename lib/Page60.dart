import 'package:flutter/material.dart';

class Page60 extends StatefulWidget {
  const Page60({super.key});

  @override
  State<Page60> createState() => _Page60State();
}

class _Page60State extends State<Page60> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 240,
              width: 430,
              decoration: const BoxDecoration(color: Colors.black),
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.navigate_before,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 80),
                        child: Text('Payment Methods',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 53,
                        width: 91,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.local_atm,
                          size: 50,
                        ),
                      ),
                      Container(
                        height: 53,
                        width: 91,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.paypal_rounded,
                                color: Colors.white, size: 20),
                            Text(
                              'PayPal',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 53,
                        width: 91,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.apple, color: Colors.white, size: 15),
                            Text(
                              'Pay',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Saved Cards',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 125),
                  child: Text(
                    'Add New Card',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),

                //bottom sheet code start


                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade400),
                  child: FittedBox(
                    alignment: Alignment.center,
                    child: IconButton(onPressed: (){

                      showModalBottomSheet<void>(
                        context: context,backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        builder: (BuildContext context) {
                          return
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const SizedBox(width: 20,),
                                      IconButton(onPressed: (){
                                        Navigator.pop(context);
                                      }, icon: const Icon(Icons.close,size: 20,),color: Colors.lightBlueAccent,)
                                    ],
                                  ),
                                  const Text(
                                    'Add new Card',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    decoration:  InputDecoration(
                                       labelText: 'Card number',
                                      hintText: '0000 0000 0000 0000' ,
                                      prefixIcon: const Icon(Icons.credit_card),
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      suffixIcon: Icon(Icons.bubble_chart),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Colors.grey.shade100),
                                        borderRadius: BorderRadius.circular(10),
                                        // Rounded border
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          decoration:  InputDecoration(
                                            labelText: 'Expiry date',
                                            hintText: '02/26',
                                            fillColor: Colors.grey.shade100,
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(width: 1, color: Colors.grey.shade100),
                                              borderRadius: BorderRadius.circular(10),
                                              // Rounded border
                                            ),
                                          ),
                                          keyboardType: TextInputType.datetime,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: TextFormField(
                                          decoration:  InputDecoration(
                                            hintText: '...',
                                            labelText: 'CVC/CVV',
                                            fillColor: Colors.grey.shade100,
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(width: 1, color: Colors.grey.shade100),
                                              borderRadius: BorderRadius.circular(10),
                                              // Rounded border
                                            ),
                                          ),
                                          keyboardType: TextInputType.number,
                                          obscureText: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    decoration:  InputDecoration(
                                      labelText: 'Name on card',
                                      hintText: 'Jacob Jones',
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Colors.grey.shade100),
                                        borderRadius: BorderRadius.circular(10),
                                        // Rounded border
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                                    ),
                                    child: const Text('Save'),
                                  ),
                                ],
                              ),
                            );
                        },
                      );                    }, icon: const Icon(Icons.add),
                    )
                ),
                  ),

                //bottom sheet code end
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // smooth page container code

            SizedBox(
              height: 180,
              width: 863,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 160,
                    width: 285,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.pink),
                    child: const Image(
                        image: AssetImage('assets/card 1.png'),
                        fit: BoxFit.fill
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 197,
                    width: 280,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.pink),
                    child: const Image(
                        image: AssetImage('assets/card 1.png'),
                        fit: BoxFit.fill),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 197,
                    width: 280,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.pink),
                    child: const Image(
                        image: AssetImage('assets/card 1.png'),
                        fit: BoxFit.fill),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),

            // smooth page container code end


            const SizedBox(
              height: 20,
            ),
            Container(
              width: screenSize.width - 40,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 0.5, color: Colors.white),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      'Card Number',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 100, bottom: 2, top: 5),
                    child: Text(
                      '0000 0000 0000 0000',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Divider(
                      height: 1,
                      color: Colors.grey.shade300,
                      thickness: 1.2,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 90),
                        child: Text(
                          'Name',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 70),
                        child: Text(
                          'Card ID',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('jocob jones'),
                          SizedBox(
                            width: 80,
                          ),
                          Text('Master Card',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
