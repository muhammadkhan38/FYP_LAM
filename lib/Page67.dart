import 'package:flutter/material.dart';
import 'Template/Agreement_detatil.dart';
import 'Template/LeaseAgreement.dart';
import 'Template/PartnershipAgreement.dart';
import 'Template/Property_Deal_ Agrement.dart';
import 'Template/SalesAgreement.dart';
class Page67 extends StatefulWidget {
  const Page67({super.key});

  @override
  State<Page67> createState() => _Page67State();
}


class _Page67State extends State<Page67> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    const SizedBox(width: 40),
                    const Text(
                      'Search Template',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.white,
              //   ),
              //   width: size.width - 40,
              //   child: TextFormField(
              //     decoration: const InputDecoration(
              //       filled: false,
              //       fillColor: Color(0xffFFFFFF),
              //       hintText: 'Enter clause',
              //       suffixIcon: Icon(
              //         Icons.align_vertical_bottom_outlined,
              //         color: Colors.lightBlue,
              //       ),
              //       prefixIcon: Icon(
              //         Icons.search_rounded,
              //         color: Colors.lightBlue,
              //       ),
              //       hintStyle: TextStyle(
              //         fontWeight: FontWeight.w500,
              //         fontSize: 14,
              //         color: Colors.grey,
              //       ),
              //       border: InputBorder.none,
              //       enabledBorder: InputBorder.none,
              //       focusedBorder: InputBorder.none,
              //       contentPadding:
              //       EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PropertyDealAgreementScreen()));
                },
                child: Container(
                  width: size.width-35, // Container width
                  height: 60.0, // Container height
                  alignment: Alignment.center, // Aligns child widget
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(20.0), // Rounded corners
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26, // Shadow color
                        blurRadius: 10.0, // Blur radius
                        offset: Offset(5, 5), // Offset for shadow
                      ),
                    ],
                    border: Border.all(
                      color: Colors.white, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  child: const Text(
                    "Property Deal Agreement",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AgreementDatail(true,"partnership_agreement.json")));
                },
                child: Container(
                  width: size.width-35, // Container width
                  height: 60.0, // Container height
                  alignment: Alignment.center, // Aligns child widget
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(20.0), // Rounded corners
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26, // Shadow color
                        blurRadius: 10.0, // Blur radius
                        offset: Offset(5, 5), // Offset for shadow
                      ),
                    ],
                    border: Border.all(
                      color: Colors.white, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  child: const Text(
                    "Partnership Agreement",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AgreementDatail(true, "employment_agreement.json")));
                },
                child: Container(
                  width: size.width-35, // Container width
                  height: 60.0, // Container height
                  alignment: Alignment.center, // Aligns child widget
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(20.0), // Rounded corners
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26, // Shadow color
                        blurRadius: 10.0, // Blur radius
                        offset: Offset(5, 5), // Offset for shadow
                      ),
                    ],
                    border: Border.all(
                      color: Colors.white, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  child: const Text(
                    "Employment Agreement ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SalesAgreementScreen()));
                },
                child: Container(
                  width: size.width-35, // Container width
                  height: 60.0, // Container height
                  alignment: Alignment.center, // Aligns child widget
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(20.0), // Rounded corners
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26, // Shadow color
                        blurRadius: 10.0, // Blur radius
                        offset: Offset(5, 5), // Offset for shadow
                      ),
                    ],
                    border: Border.all(
                      color: Colors.white, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  child: const Text(
                    "Sales Agreement",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LeaseAgreementScreen()));
                },
                child: Container(
                  width: size.width-35, // Container width
                  height: 60.0, // Container height
                  alignment: Alignment.center, // Aligns child widget
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(20.0), // Rounded corners
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26, // Shadow color
                        blurRadius: 10.0, // Blur radius
                        offset: Offset(5, 5), // Offset for shadow
                      ),
                    ],
                    border: Border.all(
                      color: Colors.white, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  child: const Text(
                    "Lease Agreement",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),


            ],
          ),
        )
    );
  }
}

































































// import 'package:flutter/material.dart';
//
// import 'Page_38.dart';
//
// class Page67 extends StatefulWidget {
//   const Page67({super.key});
//
//   @override
//   State<Page67> createState() => _Page67State();
// }
//
// class _Page67State extends State<Page67> {
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
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: const Icon(Icons.arrow_back_ios),
//                   ),
//                   const SizedBox(width: 40),
//                   const Text(
//                     'Search Template',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 15),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//               ),
//               width: size.width - 10,
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   filled: false,
//                   fillColor: Color(0xffFFFFFF),
//                   hintText: 'Enter clause',
//                   suffixIcon: Icon(
//                     Icons.align_vertical_bottom_outlined,
//                     color: Colors.lightBlue,
//                   ),
//                   prefixIcon: Icon(
//                     Icons.search_rounded,
//                     color: Colors.lightBlue,
//                   ),
//                   hintStyle: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                   border: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   contentPadding:
//                   EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
//                 ),
//               ),
//             ),
//
//
//             const SizedBox(height: 15),
//
//
//             // Add the TabBarView here
//             const SizedBox(height: 15,),
//
//             SizedBox(
//               //height: size.height, // Adjust height based on your layout
//               child:  Column(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) =>  Page38()));
//                   },
//                   child: Center(
//                     child: Container(
//
//                       width: size.width-20,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.white,
//                       ),
//                       child: const Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(top: 8.0,),
//                             child: Text('Lorem Ipsum Settlement Agreement',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14),),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(left: 10),
//                             child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry."
//                                 " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Color(0xff838788)),),
//                           ),
//                           SizedBox(height: 10,),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//
//
//
//
//                 Padding(
//                   padding: const EdgeInsets.only(right: 50),
//                   child: Container(
//                     width: size.width-20,
//                    color: Colors.pinkAccent,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text("muhammad khan frlalksdjf;lajksdf"),
//                         Text("muhammad khan frlalksdjf;lajksdf"),
//                         Text("muhammad khan frlalksdjf;lajksdf"),
//                       ],
//                     ),
//                   ),
//                 )

                // Container(
                //   width: size.width-20,
                //   padding: EdgeInsets.all(12),
                //
                //
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.white,
                //   ),
                //   child: const Column(
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.only(top: 8.0,right: 60),
                //         child: Text('Lorem Ipsum Settlement Agreement',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14),),
                //       ),
                //       Padding(
                //         padding: EdgeInsets.only(left: 10),
                //         child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                //             " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Color(0xff838788)),),
                //       ),
                //       SizedBox(height: 10,),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 15,),
                // Container(
                //   width: size.width-20,
                //
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.white,
                //   ),
                //   child: const Column(
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.only(top: 8.0,right: 60),
                //         child: Text('Lorem Ipsum Settlement Agreement',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14),),
                //       ),
                //       Padding(
                //         padding: EdgeInsets.only(left: 10),
                //         child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                //             " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Color(0xff838788)),),
                //       ),
                //       SizedBox(height: 10,),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 15,),
                // Container(
                //   width: size.width-20,
                //
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.white,
                //   ),
                //   child: const Column(
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.only(top: 8.0,right: 60),
                //         child: Text('Lorem Ipsum Settlement Agreement',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14),),
                //       ),
                //       Padding(
                //         padding: EdgeInsets.only(left: 10),
                //         child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                //             " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Color(0xff838788)),),
                //       ),
                //       SizedBox(height: 10,),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 15,),
                // Container(
                //   width: size.width-20,
                //
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.white,
                //   ),
                //   child: const Column(
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.only(top: 8.0,right: 60),
                //         child: Text('Lorem Ipsum Settlement Agreement',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14),),
                //       ),
                //       Padding(
                //         padding: EdgeInsets.only(left: 10),
                //         child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                //             " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Color(0xff838788)),),
                //       ),
                //       SizedBox(height: 10,),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 15,),
                // Container(
                //   width: size.width-20,
                //
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.white,
                //   ),
                //   child: const Column(
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.only(top: 8.0,right: 60),
                //         child: Text('Lorem Ipsum Settlement Agreement',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14),),
                //       ),
                //       Padding(
                //         padding: EdgeInsets.only(left: 10),
                //         child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                //             " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Color(0xff838788)),),
                //       ),
                //       SizedBox(height: 10,),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 15,),
                // Container(
                //   width: size.width-20,
                //
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.white,
                //   ),
                //   child: const Column(
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.only(top: 8.0,right: 60),
                //         child: Text('Lorem Ipsum Settlement Agreement',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14),),
                //       ),
                //       Padding(
                //         padding: EdgeInsets.only(left: 10),
                //         child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                //             " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Color(0xff838788)),),
                //       ),
                //       SizedBox(height: 10,),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 15,),

//
//
//               ],
//
//                                   ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
