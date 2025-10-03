import 'package:flutter/material.dart';
import 'Template/Agreement_detatil.dart';
class SearchTemplates extends StatefulWidget {
  const SearchTemplates({super.key});

  @override
  State<SearchTemplates> createState() => _SearchTemplatesState();
}


class _SearchTemplatesState extends State<SearchTemplates> {
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

              const SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AgreementDatail(true,"property_deal_agreement.json")));
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AgreementDatail(true,"sales_agreement.json")));
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AgreementDatail(true,"lease_agreement.json")));
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
