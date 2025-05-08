import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'CustomTextFormField.dart';
import 'Page21.dart';
import 'CustomTextButton.dart';


class Page40 extends StatefulWidget {


  final dynamic agreement_ids;
  const Page40({super.key, required this.agreement_ids,});

  @override
  State<Page40> createState() => _Page40State();
}

class _Page40State extends State<Page40> {
  final TextEditingController EmailController = TextEditingController();
  bool isLoading = false;

  Future<void> fetchAgreement() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse("https://nda.yourailist.com/api/shareAgreement"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({
          "agreement_id": widget.agreement_ids,
          "email": EmailController.text,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        print("Success! Agreement data:");
        print(data);

        // Navigate to new screen after success
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Page21()), // Replace with your target screen
        );
      } else {
        print("Error ${response.statusCode}: ${response.body}");
      }
    } catch (e) {
      print("Exception occurred: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

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
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  const SizedBox(width: 30),
                  const Text(
                    'Send Document',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: size.width - 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: EmailController,
                    hintText: 'Enter The Email  of Second Party',
                    icon: Icons.email,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.perm_contact_calendar, color: Colors.lightBlue)),
                      const Text(
                        'Select From Contacts',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Color(0xff00C2FF)),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.facebook, color: Colors.lightBlue, size: 45)),
                      CircleAvatar(
                          radius: 20,
                          backgroundColor: const Color(0xff00E676),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.phone, color: Colors.white))),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: size.width - 40,
                    height: 57,
                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                        fetchAgreement();
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.blueAccent,
                        backgroundColor: const Color.fromRGBO(15, 104, 251, 1),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : const Text(
                        'Send Agreement',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: size.width - 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Non-Disclosure Agreement Title',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Read More',
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w700, color: Color(0xff00C2FF)),
                    ),
                  ),
                  SizedBox(height: 20)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




void _showAgreementDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child:SizedBox(
          height: 340,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20,),
              Container(

                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blueAccent, // Border color
                    width: 7.0, // Border width
                  ),

                ),

                child: const CircleAvatar(
                  radius: 60,

                  backgroundColor: Color(0xff00C2FF),
                  child: Padding(
                    padding: EdgeInsets.only(left: 55.0,bottom: 49),
                    child: Icon(Icons.check,size: 80,),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Text('Agreement Sent',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
              const SizedBox(height: 5,),
              const Text('Your Agreement have been successfully Sent to',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400),),
              const Text('LOREM IPSUM NAME',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xff1268FB)),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>const Page21()));
                  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => Page21()),(route) => false, // new change
                  );
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
                  const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                ),
                child: const Text(
                  'Back to Home',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),

      );
    },
  );
}































// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:nda_application/Page_38.dart';
//
// class Page40 extends StatefulWidget {
//   const Page40({super.key});
//
//   @override
//   State<Page40> createState() => _Page40State();
// }
//
// class _Page40State extends State<Page40> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: 124,
//               color: Colors.white,
//               child: Row(
//                 children: [
//                   IconButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: const Icon(Icons.arrow_back_ios)),
//                   const SizedBox(
//                     width: 30,
//                   ),
//                   const Text(
//                     'Send Document',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               width: size.width - 10,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: Colors.white,
//               ),
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                       width: size.width - 30,
//                       height: 56,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(
//                           color: Colors.grey, // border color
//                           width: 1.0, // border width
//                         ),
//
//                         color: Colors.grey.shade200,
//                       ),
//                       child: Row(
//                         children: [
//                           IconButton(
//                             onPressed: () {},
//                             icon: const Icon(
//                               Icons.person,
//                               color: Color(0xff474646),
//                             ),
//                           ),
//                           const Text(
//                             'Lorem Ipsum Name of user',
//                             style: TextStyle(
//                                 fontSize: 14, fontWeight: FontWeight.w500),
//                           ),
//                           const SizedBox(
//                             width: 30,
//                           ),
//                           IconButton(
//                             onPressed: () {},
//                             icon: const Icon(
//                               Icons.keyboard_arrow_down,
//                               color: Color(0xff474646),
//                             ),
//                           ),
//                         ],
//                       )),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                     children: [
//                       IconButton(
//                           onPressed: () {},
//                           icon: const Icon(
//                             Icons.perm_contact_calendar,
//                             color: Colors.lightBlue,
//                           )),
//                       const Text(
//                         'Select From Contacts',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 13,
//                             color: Color(0xff00C2FF)),
//                       ),
//                       const SizedBox(
//                         width: 20,
//                       ),
//                       IconButton(
//                           onPressed: () {},
//                           icon: const Icon(
//                             Icons.facebook,
//                             color: Colors.lightBlue,
//                             size: 45,
//                           )),
//                       CircleAvatar(
//                           radius: 20,
//                           backgroundColor: const Color(0xff00E676),
//                           child: IconButton(
//                               onPressed: () {},
//                               icon: const Icon(
//                                 Icons.phone,
//                                 color: Colors.white,
//                               ))),
//                     ],
//                   ),
//                   const SizedBox(height: 10,),
//                   Container(
//                     width: size.width-40,
//                     height: 57,
//                     child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=>const Page38()));
//                         },
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Colors.blueAccent,
//                         // backgroundColor: Colors.blueAccent.shade400,
//                         backgroundColor: const Color.fromRGBO(15, 104, 251, 1),
//                         elevation: 3,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                         padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
//                       ),
//
//                         child: const Text(
//                           'Send Agreement',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w700,
//                               fontSize: 14,
//                               color: Colors.white),
//
//                         ),
//
//                     ),
//
//                   ),
//                   const SizedBox(height: 20,),
//
//                 ],
//               ),
//             ),
//             const SizedBox(height: 15,),
//             Container(
//               width: size.width-10,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: Colors.white,
//               ),
//               child:  const Column(
//
//
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                     SizedBox(height: 10,),
//                   Padding(
//                     padding: EdgeInsets.only(left: 15.0),
//                     child: Text('Non-Disclosure Agreement Title',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: Text('1. Purpose',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),),
//                   ),
//                   SizedBox(height: 5,),
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: Text('The purpose of this Agreement is to outline the terms and conditions for'
//                         'the branding and web design services to be provided by Contractor to'
//                         'Client.',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,),),
//                   ),
//                   SizedBox(height: 12,),
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: Text('2. Scope of work',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),),
//                   ),
//                   SizedBox(height: 5,),
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: Text('Contractor will provide the following services to Client:',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,),),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: Text('• Branding services, including brand strategy consultation,logo ,',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,),),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: Text('\t\t design brand guidelines, and any other branding materials as agreed ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,),),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: Text('\t\t  upon by both parties.',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,),),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: Text('• Web design services, including the design and development of a new ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,),),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: Text('\t\t website for the Client.',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,),),
//                   ),
//                   SizedBox(height: 12,),
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: Text(' 3. Deliverables',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),),
//                   ),
//                   SizedBox(height: 5,),
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: Text(' Contractor will deliver the following to Client:',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700),),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: Text('\t\t •  A completed, fully-functional website.',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700),),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: Text('\t\t •  All source files for the website, including design files and code.',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700),),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: Text('\t\t •  Any branding materials as agreed upon by both parties.',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700),),
//                   ),
//
//                   SizedBox(height: 12,),
//
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: Text('4. Payment and Ongoing costs',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),),
//                   ),
//                   SizedBox(height: 5,),
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: Text('The Client will pay the Contractor the total agreed sum, outlined in the project package,'
//                         'for the completion of the scope of work outlined in this Agreement.'
//                         'This fee shall be paid in the following installments.',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,),),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: Text('\t\t •  50% payment due on acceptance of agreement',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700),),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: Text('\t\t •  25% payment due on completion of brand design work',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700),),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: Text('\t\t •  25% payment due on completion of web design work',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700),),
//                   ),
//                   SizedBox(height: 30,),
//                   const Divider(
//                     thickness: 1,
//                     endIndent: 20,
//                     indent: 20,
//                     height: 0,
//                   ),
//                   SizedBox(height: 15,),
//
//                   Center(child: Text('Read More',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700,color: Color(0xff00C2FF)),)),
//                   SizedBox(height: 20,)
//
//
//                 ],
//               ),
//             ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }

