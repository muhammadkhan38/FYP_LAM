import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Drawer_Class.dart';
import 'Page21.dart';
import 'Page22.dart';
import 'Page56.dart';
class Page41 extends StatefulWidget {
  const Page41({super.key});

  @override
  State<Page41> createState() => _Page41State();
}

class _Page41State extends State<Page41> {
  String _email = '';
  String _name = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _email = prefs.getString('email') ?? '';
      _name = prefs.getString('name') ?? '';

    });
  }




  Widget build(BuildContext context) {

    Size screenSize =MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        title: const Text('Profile',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white),),
          titleSpacing: 105,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the color for the drawer icon
        ),
      ),
      drawer: const DrawerClass(),
      backgroundColor: Colors.grey.shade100,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(30),topLeft:Radius.circular(30)),
        child: BottomAppBar(
          height: 70,
          color: Colors.black87,
          notchMargin: 8,
          elevation: 40,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>  const Page21()));
                },
                icon: const Icon(CupertinoIcons.house_alt),splashColor: Colors.lightBlue,
                color: Colors.lightBlueAccent,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.doc_text),splashColor: Colors.lightBlue,
                color: Colors.lightBlueAccent,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>  const Page22()));
                },
                icon: const Icon(CupertinoIcons.bookmark),splashColor: Colors.lightBlue,
                color: Colors.lightBlueAccent,
              ),
              IconButton(
                onPressed: () {
                },
                icon: const Icon(CupertinoIcons.person),splashColor: Colors.lightBlue,
                color: Colors.lightBlueAccent,
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: 430,
                  color: Colors.black87,
                  child:      Column(
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 10,),
                          const CircleAvatar(
                            backgroundImage: AssetImage('assets/qasim.png'),
                          ),
                          SizedBox(height: 10,),




                         // Text('Muhammad khan',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white),),
                          Text(_name,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white),),
                          SizedBox(height: 5,),


                          //Text('Muhammadkhan8338@mail.com',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600,color: Colors.grey),),
                          Text(_email,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600,color: Colors.grey),),


                          SizedBox(height: 5,),
                          Text(' flutter UI, Development',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.lightBlueAccent),),


                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 130,left: 30),
                  child: Container(
                    height: 129,
                    width: screenSize.width-60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:  const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                          Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20,top: 20),
                              child: Icon(Icons.flag,color: Colors.lightBlueAccent,),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20,top: 40),
                              child: Icon(Icons.date_range,color: Colors.green,),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20,right: 50),
                              child: Text('12',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.lightBlueAccent),),
                            ),
                            SizedBox(height: 5,),
                            Text('Total Agreements',style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500,color: Colors.grey),),
                            SizedBox(height: 15,),
                            Padding(
                              padding: EdgeInsets.only(top: 15,right: 50,),
                              child: Text('12',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.green),),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('Pending Agreements',style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500,color: Colors.green),),
                            ),
                          ],
                        ),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20,top: 20),
                              child: Icon(Icons.flag,color: Colors.yellow,),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25,top: 40),
                              child: Icon(Icons.star,color: Colors.grey,),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 15,right: 10),
                              child: Text('Nill',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.yellow),),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('Membership',style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500,color: Colors.grey),),
                            ),
                            SizedBox(height: 20,),
                            Padding(
                              padding: EdgeInsets.only(top: 10,right: 20,),
                              child: Text('12',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey),),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text('Total Coins',style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500,color: Colors.green),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20,),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Page56(),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  Colors.lightBlueAccent,), // Background color
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(30.0),
                  ),
                ),
              ),
              child:  SizedBox(
                  height: 25,
                  width: screenSize.width-70,
                  child: const Center(
                    child: Text("Buy Membership",
                        style: TextStyle(color: Colors.white)),
                  )), // Text style
            ),
            const SizedBox(height: 20,),
            Container(
              height: 419,
              width: screenSize.width-50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.person,color: Colors.grey,),
                    title: Text('Personal Details',style: TextStyle(fontSize: 12,color: Colors.black),),
                    trailing: Icon(Icons.navigate_next,color: Colors.grey,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Divider(color: Colors.grey.shade300,thickness: 0.5,),
                  ),
                  const ListTile(
                    leading: Icon(Icons.edit,color: Colors.grey,),
                    title: Text('Saved Signatures',style: TextStyle(fontSize: 12,color: Colors.black),),
                    trailing: Icon(Icons.navigate_next,color: Colors.grey,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Divider(color: Colors.grey.shade300,thickness: 0.5,),
                  ),
                  const ListTile(
                    leading: Icon(Icons.person,color: Colors.grey,),
                    title: Text('Language',style: TextStyle(fontSize: 12,color: Colors.black),),
                    trailing: Icon(Icons.navigate_next,color: Colors.grey,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Divider(color: Colors.grey.shade300,thickness: 0.5,),
                  ),
                  const ListTile(
                    leading: Icon(Icons.notifications,color: Colors.grey,),
                    title: Text('Notification',style: TextStyle(fontSize: 12,color: Colors.black),),
                    trailing: Icon(Icons.navigate_next,color: Colors.grey,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Divider(color: Colors.grey.shade300,thickness: 0.5,),
                  ),
                  const ListTile(
                    leading: Icon(Icons.privacy_tip,color: Colors.grey,),
                    title: Text('Privacy',style: TextStyle(fontSize: 12,color: Colors.black),),
                    trailing: Icon(Icons.navigate_next,color: Colors.grey,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Divider(color: Colors.grey.shade300,thickness: 0.5,),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}














































// class PasswordValidationForm extends StatefulWidget {
//   @override
//   _PasswordValidationFormState createState() => _PasswordValidationFormState();
// }
//
// class _PasswordValidationFormState extends State<PasswordValidationForm> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//
//   @override
//   void dispose() {
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }
//
//   String? _passwordValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Password is required';
//     }
//     if (value.length < 8) {
//       return 'Password must be at least 8 characters long';
    //}
  //   if (!RegExp(r'[A-Z]').hasMatch(value)) {
  //     return 'Password must include at least one uppercase letter';
  //   }
  //   if (!RegExp(r'[a-z]').hasMatch(value)) {
  //     return 'Password must include at least one lowercase letter';
  //   }
  //   if (!RegExp(r'[0-9]').hasMatch(value)) {
  //     return 'Password must include at least one number';
  //   }
  //   if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
  //     return 'Password must include at least one special character';
  //   }
  //   return null; // Password is valid
  // }
  //
  // String? _confirmPasswordValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Confirm Password is required';
  //   }
  //   if (value != _passwordController.text) {
  //     return 'Passwords do not match';
  //   }
  //   return null; // Confirm password is valid
  // }
  //
  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
      // If the form is valid, show a success message or proceed with further logic
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Form successfully submitted!')),
  //     );
  //   }
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text('Password Validation')),
  //     body: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Form(
  //         key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(labelText: 'Password'),
//                 validator: _passwordValidator,
//               ),
//               SizedBox(height: 16),
//               TextFormField(
//                 controller: _confirmPasswordController,
//                 obscureText: true,
//                 decoration: InputDecoration(labelText: 'Confirm Password'),
//                 validator: _confirmPasswordValidator,
//               ),
//               SizedBox(height: 32),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: _submitForm,
//                   child: Text('Submit'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
