import 'package:flutter/material.dart';
class Page49 extends StatefulWidget {
  const Page49({super.key});

  @override
  State<Page49> createState() => _Page49State();
}

class _Page49State extends State<Page49> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
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
                    'Agreement (NDA)',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit_calendar_rounded,
                        color: Colors.lightBlueAccent,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            Container(
              width: 166,
              height: 47,
              decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(61),
                color: const Color.fromRGBO(0, 194, 255, 1)
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10,),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.rotate_left_outlined,color: Colors.white,)),
                  const Text('Regenerate',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.white),)
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


                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '5. Terms',
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'This Agreement will begin on the date of acceptance and will remain in effect until all services have been completed.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),


                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '6. Termination',
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                     'Either party may terminate this Agreement at any time, for any reason, with written notice '
                         'to the other party. Upon termination, Contractor will deliver all final deliverables to '
                         'Client and will be paid for all work completed up to the date of termination.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),





                ],
              ),
            ),
            const SizedBox(height: 10,),

            const SizedBox(height: 25,),
            ElevatedButton(
              onPressed: () {
                //  Navigator.push(context, MaterialPageRoute(builder: (context) => const Page51()));
               // Navigator.push(context, MaterialPageRoute(builder: (context) => const Page49()));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blueAccent,
                // backgroundColor: Colors.blueAccent.shade400,
                backgroundColor: const Color.fromRGBO(15, 104, 251, 1),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
              ),
              child: const Text(
                'Create',
                style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 35,),

          ],
        ),
      ),
    );
  }
}
