import 'package:final_year_project/page28.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class Page27 extends StatefulWidget {
  const Page27({super.key});

  @override
  _Page27State createState() => _Page27State();
}

class _Page27State extends State<Page27> {
  String _selectedNDAType = " ";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              children: [
                Container(
                  height: 124,
                  color: Colors.white,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
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
                        width: size.width - 20,
                        height: 49,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xff474646),
                        ),
                        child: const Center(
                          child: Text(
                            'Type of NDA',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildRadioOption(
                        size,
                        'Unilateral',
                        Icons.circle_outlined,const Color(0xFF00C2FF),

                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildRadioOption(
                        size,
                        'Mutual',
                        Icons.circle_outlined,Color(0xFF00C2FF),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
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
                        style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Page28()));
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color(0xFF00C2FF),
                        backgroundColor: Colors.blueAccent.shade400,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRadioOption(Size size, String title, IconData icon, Color colors ) {
    return Container(
      width: size.width - 29,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffF7F7F7),
      ),
      child: ListTile(
        leading: Radio<String>(
          value: title,
          groupValue: _selectedNDAType,
         activeColor: const Color(0xFF00C2FF),

          focusColor:CupertinoColors.destructiveRed,

          onChanged: (String? value) {
            setState(() {
              _selectedNDAType = value!;


            });
          },
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, ),
        ),

      ),
    );
  }
}
