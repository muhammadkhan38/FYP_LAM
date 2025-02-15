import 'package:final_year_project/page30.dart';
import 'package:flutter/material.dart';

class Page29 extends StatelessWidget {
  const Page29({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:[
            Container(
              height: 124,
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, icon: const Icon(Icons.arrow_back_ios)),
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
              height: 30,
            ),
            Container(
              width: size.width-10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: Column(

                children: [

                  const SizedBox(height: 10,),
                  Container(
                    width: size.width - 20,
                    height: 49,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xff474646)),
                    child: const Center(
                        child: Text(
                          'Governing Law',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        )),
                  ),

                  const SizedBox(height: 20,),

                  const Padding(
                    padding: EdgeInsets.only(right: 220),
                    child: Text('Country',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                  ),
                  const SizedBox(height: 10,),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffF7F7F7),
                    ),
                    width: size.width - 40,
                    child: TextFormField(
                      decoration:  InputDecoration(
                        filled: false,
                        suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_down_sharp),),
                       // fillColor: Color(0xffF7F7F7),
                        hintText: 'Select country',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.grey,

                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),

                      ),
                    ),
                  ),

                  const SizedBox(height: 20,),

                  const Padding(
                    padding: EdgeInsets.only(right: 230),
                    child: Text('State',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                  ),
                  const SizedBox(height: 10,),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffF7F7F7),
                    ),
                    width: size.width - 40,
                    child: TextFormField(
                      decoration:  InputDecoration(
                        filled: false,
                        suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_down_sharp),),
                        // fillColor: Color(0xffF7F7F7),
                        hintText: 'Select State',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.grey,

                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),

                      ),
                    ),
                  ),

                  const SizedBox(height: 20,),

                  const Padding(
                    padding: EdgeInsets.only(right: 230),
                    child: Text('City',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                  ),
                  const SizedBox(height: 10,),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffF7F7F7),
                    ),
                    width: size.width - 40,
                    child: TextFormField(
                      decoration:  InputDecoration(
                        filled: false,
                        suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_down_sharp),),
                        // fillColor: Color(0xffF7F7F7),
                        hintText: 'Select City',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.grey,

                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),

                      ),
                    ),
                  ),

                  const SizedBox(height: 20,),

                ],
              ),
            ),
            const SizedBox(height: 70,),
            Row(
              children: [
                const SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: const Color(0xff00C2FF), elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  ),
                  child: const Text(
                    'Previous',
                    style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w700),
                  ),
                ),

                const SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Page30()));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blueAccent, backgroundColor: Colors.blueAccent.shade400, elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w700),
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
