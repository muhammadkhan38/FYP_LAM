import 'package:flutter/material.dart';
import 'CutomTextField.dart';
import 'Page67.dart';
import 'Page_36.dart';
import 'Page_37.dart';
import 'Page_38.dart';
import 'Widgets/Reusable_Gradient_Button.dart';
class Page34 extends StatelessWidget {
  const Page34({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return  Scaffold(
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
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Non Disclosure Agreement',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container( width:screenSize.width-10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10,),
                      Container(

                        width:screenSize.width-20,
                        height: 49,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xff474646)
                        ),
                        child: const Center(child: Text('Create Agreement',style: TextStyle(fontSize: 16,color: Colors.white),)),

                      ),
                       const SizedBox(height: 10,),

                       Padding(
                         padding: const EdgeInsets.only(left: 10,right: 10),
                         child: Row(
                           //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                width: 153,
                                height: 145,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color(0xffF7F7F7)
                                ),
                                child: Column(
                                  children: [
                                    IconButton(onPressed: (){

                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Page67()));
                                     // Navigator.push(context, MaterialPageRoute(builder: (context)=> EmploymentAgreement ()));
                                    },
                                        icon: const Icon(Icons.library_music_outlined,size: 70,color: Colors.lightBlueAccent,)),
                                    const Text('Template Library',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),),
                                    const Text('Create a document by using \n our ready to use templates',style: TextStyle(fontSize: 10,color: Color(0xFF838788)),)

                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),

                            Expanded(
                              child: Container(
                                width: 153,
                                height: 145,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color(0xffF7F7F7)
                                ),
                                child: Column(
                                  children: [
                                    IconButton(onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Page37()));
                                    }, icon: const Icon(Icons.library_books,size: 70,color: Colors.lightBlueAccent,)),
                                    const Text('Ai Assistant',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),),
                                    const Text('Create a document with help ',style: TextStyle(fontSize: 10,color: Color(0xff838788)),),
                                    const Text('of Ai ',style: TextStyle(fontSize: 10,color: Color(0xff838788)),)

                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,)

                          ],
                         ),
                       ),
                      const SizedBox(height: 10,),

                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          width: screenSize.width/2-10,
                          height: 145,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xffF7F7F7)
                          ),
                          child: Column(
                            children: [
                              IconButton(onPressed: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context)=> DynamicTextFormFields()));
                               // Navigator.push(context, MaterialPageRoute(builder: (context)=> const CustomTextFields()));
                               // Navigator.push(context, MaterialPageRoute(builder: (context)=> EmploymentAgreement()));
                               // Navigator.push(context, MaterialPageRoute(builder: (context)=> DynamicFormFieldsScreen()));
                                },
                                  icon: const Icon(Icons.library_books,size: 70,color: Colors.lightBlueAccent,)),
                              const Text('Custom Create',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),),
                              const Text('Create a custom agreement ',style: TextStyle(fontSize: 10,color: Color(0xff838788)),),
                              const Text('based on your needs',style: TextStyle(fontSize: 10,color: Color(0xff838788)),)

                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),

                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: screenSize.width/2-30,
                      height: 47,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: const Color(0xFF00C2FF),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                        ),
                        child: const Text(
                          'Previous',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),

                    GradientButton(
                      text: 'Next',
                      width: screenSize.width/2-10,
                      height: 47,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Page38()),
                        );
                      },
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //
                    //  Navigator.push(context, MaterialPageRoute(builder: (context)=>  Page38()));
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     foregroundColor: Colors.blueAccent,
                    //     backgroundColor: Colors.blueAccent.shade400,
                    //     elevation: 3,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(30.0),
                    //     ),
                    //     padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                    //   ),
                    //   child: const Text(
                    //     'Next',
                    //     style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),
                    //   ),
                    // ),
                  ],
                ),


              ],


            ),

          ],

        ),
      ),
    );
  }
}
