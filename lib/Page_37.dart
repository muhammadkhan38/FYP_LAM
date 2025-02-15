// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'Page_38.dart';

class Page37 extends StatefulWidget {
  const Page37({super.key});

  @override
  State<Page37> createState() => _Page37State();
}

class _Page37State extends State<Page37> {
 bool isSwitched = true;
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 124,
              color: Colors.white,
              child: Row(
                children: [
                  // const SizedBox(width: 10,height: 100,),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),

                  const Padding(
                    padding: EdgeInsets.only(left: 70.0),
                    child: Text(
                      'Ai Assistant',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Please Fill the details",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Color(0xff000000)),
            ),
            const Text(
              "Please fill the details bellow",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xffAAAAAA)),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 35),
              child: Text(
                "Enter Reason for your Agreement",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              width: size.width - 40,
              child: TextFormField(
                decoration: const InputDecoration(
                  filled: false,
                  fillColor: Color(0xffFFFFFF),
                  hintText: 'Enter reason',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 49.0),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              width: size.width - 40,
              child: Row(
                children: [
                  const SizedBox(width: 15,),
                  const Text(
                    "Keep Agreement Confidential",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  const SizedBox(width: 25,),
                  Switch.adaptive(
                    value: isSwitched,
                    onChanged: (bool value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeColor: isSwitched ? Colors.lightBlue : Colors.grey.shade50,
                    inactiveThumbColor: isSwitched ? Colors.green : Colors.lightBlue,
                    inactiveTrackColor: isSwitched ? Colors.green[200] : Colors.lightBlueAccent,
                  ),

                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 190.0),
              child: Text(
                'Agreement Duration',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(

                  height: 45,
                  width: size.width / 2 - 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'From,\t 00-00-000',
                      hintStyle: TextStyle(color: Color(0xff9DA0AF)),

                      suffixIcon: Icon(
                        Icons.date_range,
                        color: Colors.lightBlue,
                      ),
                      filled: false,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.all(10)
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 45,
                  width: size.width / 2 - 15,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'From,\t 00-00-000',
                      hintStyle: TextStyle(color: Color(0xff9DA0AF)),

                      suffixIcon: Icon(
                        Icons.date_range,
                        color: Colors.lightBlue,


                      ),


                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.all(10)
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 90),
              child: Text(
                'Please explain your agreements',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 148,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffFFFFFF),
              ),
              width: size.width - 20,
              child: TextFormField(
                decoration: const InputDecoration(
                  filled: false,
                  fillColor: Color(0xffFFFFFF),
                  hintText: 'Enter reason',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
                ),
                maxLines: 5,
                // minLines: 3,
                maxLength: 150,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Please explain your Agreement in detail for our Ai to construct'
              ' \nthe best possible agreement for you e.g ( Consequences of\n'
              'breach, Jurisdictions, Obligation and remedies',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  Page38()));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blueAccent,
                // backgroundColor: Colors.blueAccent.shade400,
                backgroundColor: const Color.fromRGBO(15, 104, 251, 1),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
              ),
              child: const Text(
                'Create',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
