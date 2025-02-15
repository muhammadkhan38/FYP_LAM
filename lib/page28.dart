import 'package:final_year_project/page29.dart';
import 'package:flutter/material.dart';


class Page28 extends StatefulWidget {
  const Page28({super.key});

  @override
  State<Page28> createState() => _Page28State();
}

class _Page28State extends State<Page28> {
  String _selectedNDAType = "null";
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
            const SizedBox(height: 30),
            Container(
              width: size.width - 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size.width - 20,
                    height: 49,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xff474646)),
                    child: const Center(
                        child: Text(
                      'Purpose',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffF7F7F7),
                    ),
                    width: size.width - 40,
                    child: TextFormField(
                      decoration:  InputDecoration(
                        filled: false,
                        prefixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.search),),
                        // fillColor: Color(0xffF7F7F7),
                        hintText: 'Search Purpose',
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
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 200),
                    child: Text('Recent used'),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  _buildRadioOption(
                    size,
                    'Employment',
                    Icons.circle_outlined,

                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  _buildRadioOption(
                    size,
                    'Contract Work ( contractor, consultant, etc)',
                    Icons.circle_outlined,
                  ),

                  const SizedBox(
                    height: 12,
                  ),
                  _buildRadioOption(
                    size,
                    'Business Partnership',
                    Icons.circle_outlined,
                  ),

                  const SizedBox(
                    height: 12,
                  ),
                  _buildRadioOption(
                    size,
                    'Sale of a Business',
                    Icons.circle_outlined,
                  ),

                  const SizedBox(
                    height: 12,
                  ),
                  _buildRadioOption(
                    size,
                    'One night stand',
                    Icons.circle_outlined,
                  ),

                  const SizedBox(
                    height: 12,
                  ),
                  _buildRadioOption(
                    size,
                    'Lorem Ipsum',
                    Icons.circle_outlined,
                  ),

                  const SizedBox(
                    height: 12,
                  ),
                  _buildRadioOption(
                    size,
                    'Lorem ipsum',
                    Icons.circle_outlined,
                  ),


                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: RichText(
                text: const TextSpan(
                  text: 'Other',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: Colors.black),
                  children: [
                    TextSpan(text: ' (Specify another Purpose)',style:TextStyle(fontWeight: FontWeight.w500) ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              width: size.width - 40,
              child: TextFormField(
                decoration:  const InputDecoration(
                  filled: false,

                  // fillColor: Color(0xffF7F7F7),
                  hintText: 'Enter your purpose',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.grey,

                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),

                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),


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

                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Page29()));
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

  Widget _buildRadioOption(Size size, String title, IconData icon,) {

    return Container(
      width: size.width - 29,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffF7F7F7),
      ),
      child: ListTile(
        leading:  Theme(
          data: ThemeData(
            unselectedWidgetColor: const Color(0xff00C2FF), // Color when unselected
            hintColor: const Color(0xff00C2FF)
          ),
          child: Radio<String>(
            value: title,
            groupValue: _selectedNDAType,
            activeColor: const Color(0xff00C2FF),
            onChanged: (String? value) {
              setState(() {
                _selectedNDAType = value!;

              });
            },
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, ),
        ),

      ),
    );
  }
}
