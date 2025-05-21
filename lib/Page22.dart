import 'package:final_year_project/page27.dart';
import 'package:final_year_project/page34.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'Bottom_navigation_Bar.dart';
import 'Drawer_Class.dart';
import 'Page21.dart';
import 'Page23.dart';
import 'Page41.dart';
import 'Page67.dart';
import 'Page_48.dart';
import 'Widgets/Reusable_Floating_Action_Button.dart';

class Page22 extends StatefulWidget {
  const Page22({super.key});

  @override
  State<Page22> createState() => _Page22State();
}
int _selectedIndex = 0;
class _Page22State extends State<Page22> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Templates',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),titleSpacing: 70,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      drawer:  const DrawerClass(),
      backgroundColor: Colors.grey.shade100,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const CustomFloatingActionButton(),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                width: screenSize.width - 25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, color: Colors.grey.shade100),
                        borderRadius: BorderRadius.circular(10),
                        // Rounded border
                      ),
                      prefixIcon: const Icon(
                        CupertinoIcons.search,
                        color: Color(0xFF00C2FF),
                      ),
                      hintText: 'Search templates',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: screenSize.width - 25,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: ListTile(
                  leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(Icons.book_online_outlined,size: 60,color: Color(0xFF00C2FF),)),
                  title: const Text(
                    'Template Library',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  trailing: IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Page67(),
                        ),
                      ),
                      icon: const Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                        size: 30,
                      )),
                  subtitle: const Text(
                    'Create a document by using our ready to use template',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: screenSize.width - 25,
              height: 80,
              decoration: BoxDecoration(
                color: Color(0xFF00C2FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: ListTile(
                  leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: SvgPicture.asset(
                        'assets/Ai image.svg', // Path to your SVG file
                        fit: BoxFit.contain, // Adjust the fit as needed
                      ),

                  ),
                  title:  const Text(
                    'Legal Ai Assistant',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  trailing: IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Page48(),
                        ),
                      ),
                      icon: const Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                        size: 30,
                      )),
                  subtitle: const Text(
                    'Create a document with the help of our AI legal assistant',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: screenSize.width - 15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                      // new changes
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [

                         const Text(
                           "My Templates",
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 16,
                           ),
                         ),
                         SizedBox(
                           width: screenSize.width - 195,
                         ),
                         const Text(
                           "view all",
                           style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 14,
                               color: Color(0xFF00C2FF)),
                         ),
                       ],
                     ),
                   ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: screenSize.width - 25,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const ListTile(
                      title: Text(
                        'Lorem Ipsum Settlement Agreement',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            "Lorem Ipsum is simple dummy text of the printing and\ntypesetting industry. Lorem Ipsum has been the\nindustry's standard dummy text ever since the 1500s,\nwhen an unknown printer took a galley of type and\n scrambled it to make a type specimen book.",
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: screenSize.width - 25,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const ListTile(
                      title: Text(
                        'Mutual Non-Disclosure Agreement',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            "Lorem Ipsum is simple dummy text of the printing and\ntypesetting industry. Lorem Ipsum has been the\nindustry's standard dummy text ever since the 1500s,\nwhen an unknown printer took a galley of type and\n scrambled it to make a type specimen book.",
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: screenSize.width - 25,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const ListTile(
                      title: Text(
                        'Lorem Ipsum Advisory Agreement',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            "Lorem Ipsum is simple dummy text of the printing and\ntypesetting industry. Lorem Ipsum has been the\nindustry's standard dummy text ever since the 1500s,\nwhen an unknown printer took a galley of type and\n scrambled it to make a type specimen book.",
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
