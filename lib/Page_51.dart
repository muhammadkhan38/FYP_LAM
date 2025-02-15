import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Page_52.dart';
class Page51 extends StatefulWidget {
  const Page51({super.key});

  @override
  State<Page51> createState() => _Page51State();
}

class _Page51State extends State<Page51> {
  String _selectedNDAType = " ";
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
                  const SizedBox(
                    width: 40,
                  ),
                  const Text(
                    'Send NDA',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 95,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.confirmation_num_sharp,color: Colors.lightBlueAccent,))
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: size.width-15,
              height: 92,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                color: const Color(0xffFFFFFF),
              ),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5,),

                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text('Type of NDA',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                ),
                Row(
                  children: [
                    const SizedBox(width: 5,),
                    _buildRadioOption(
                      size,
                      'Unilateral',
                      Icons.circle_outlined,const Color(0xff00C2FF),

                    ),

                    _buildRadioOption(
                      size,
                      'Mutual',
                      Icons.circle_outlined,Colors.lightBlueAccent,
                    ),
                  ],
                )
              ],
            ),
              
            ),
            const SizedBox(height: 15,),
            Container(
              width: size.width-15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child:  const Column(


                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text('Non-Disclosure Agreement Title',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('1. Purpose',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('The purpose of this Agreement is to outline the terms and conditions for'
                        'the branding and web design services to be provided by Contractor to'
                        'Client.',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,),),
                  ),
                  SizedBox(height: 12,),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('2. Scope of work',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Contractor will provide the following services to Client:',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('• Branding services, including brand strategy consultation,logo ,',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('\t\t design brand guidelines, and any other branding materials as  ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('\t\tagreed upon by both parties.',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,),),
                  ),



                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('• Web design services, including the design and development of a',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('\t\tnew website for the Client.',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,),),
                  ),


                  SizedBox(height: 12,),


                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(' 3. Deliverables',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),),
                  ),
                  SizedBox(height: 5,),

                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(' Contractor will deliver the following to Client:',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('\t\t •  A completed, fully-functional website.',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('\t\t •  All source files for the website, including design files and code.',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('\t\t •  Any branding materials as agreed upon by both parties.',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700),),
                  ),

                  SizedBox(height: 12,),

                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('4. Payment and Ongoing costs',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('The Client will pay the Contractor the total agreed sum, outlined in the project package,'
                        'for the completion of the scope of work outlined in this Agreement.'
                        'This fee shall be paid in the following installments.',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('\t\t •  50% payment due on acceptance of agreement',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('\t\t •  25% payment due on completion of brand design work',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('\t\t •  25% payment due on completion of web design work',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700),),
                  ),
                  SizedBox(height: 30,),
                  const Divider(
                    thickness: 1,
                    endIndent: 20,
                    indent: 20,
                    height: 0,
                  ),
                  SizedBox(height: 15,),

                  Center(child: Text('Read More',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700,color: Color(0xff00C2FF)),)),
                  const SizedBox(
                    height: 10,
                  ),



                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              width: size.width-15,
              height: 69,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black87,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.edit,size: 20,color: Colors.white,)),
                  const Text('Sign Document',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),)
                ],
              ),
            ),

           const SizedBox(height: 15,),
            Container(
              width: size.width - 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: size.width - 30,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey, // border color
                          width: 1.0, // border width
                        ),

                        color: Colors.grey.shade200,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.person,
                              color: Color(0xff474646),
                            ),
                          ),
                          const Text(
                            'Lorem Ipsum Name of user',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xff474646),
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.perm_contact_calendar,
                            color: Colors.lightBlue,
                          )),
                      const Text(
                        'Select From Contacts',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Color(0xff00C2FF)),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.facebook,
                            color: Colors.lightBlue,
                            size: 45,
                          )),
                      CircleAvatar(
                          radius: 20,
                          backgroundColor: const Color(0xff00E676),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.phone,
                                color: Colors.white,
                              ))),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    width: size.width-40,
                    height: 57,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Page52()));
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.blueAccent,
                        // backgroundColor: Colors.blueAccent.shade400,
                        backgroundColor: const Color.fromRGBO(15, 104, 251, 1),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                      ),

                      child: const Text(
                        'Continue',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.white),

                      ),

                    ),

                  ),
                  const SizedBox(height: 20,),

                ],
              ),
            ),

            
            
          ],
        ),
      ),
    );
  }
  Widget _buildRadioOption(Size size, String title, IconData icon, Color Colors ) {
    return Container(
      width: size.width/2-10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),

      ),
     child:  Row(
        children: [
          Radio<String>(
            value: title,
            groupValue: _selectedNDAType,
            activeColor: const Color(0xff00C2FF),

            focusColor:CupertinoColors.destructiveRed,

            onChanged: (String? value) {
              setState(() {
                _selectedNDAType = value!;

              });
            },
          ),
           Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, ),
          ),
        ],
      )

    );
  }
}