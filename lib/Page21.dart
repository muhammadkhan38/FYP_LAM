import 'dart:convert';
import 'dart:io';
import 'package:final_year_project/store_signature_locally.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Bottom_navigation_Bar.dart';
import 'Drawer_Class.dart';
import 'Show_Single_Agreement.dart';
import 'package:image_picker/image_picker.dart';
import 'SmallText.dart';
import 'Widgets/Reusable_Floating_Action_Button.dart';
import 'dart:io' as io;



enum Status {
  complete,
  draft,
  pending,
}
class Agreement {
  final int id;
  final String title;
  final String Agreement_Creatd_date;

  Agreement({required this.id, required this.title, required this.Agreement_Creatd_date});

  factory Agreement.fromJson(Map<String, dynamic> json) {
    return Agreement(
      id: json['id'],
      title: json['title'],
      Agreement_Creatd_date: json['created_at'],
    );
  }
}

class Page21 extends StatefulWidget {

  const Page21({super.key,});

  @override
  State<Page21> createState() => _Page21State();
}

class _Page21State extends State<Page21> {
  int _selectedIndex = 0;


  List<Agreement> _agreements = [];
  bool _loading = true;
  String? _error;
  String _name = '';
  String _email = '';
//  final GetAgreementApi _userService = GetAgreementApi();



  @override
  void initState() {
    super.initState();
    _initialize();

  }
  Future<void> _initialize() async {
    await _loadUserInfo();
    if (kDebugMode) {
      print("$_email this is the init email ");
    }

   // await _userService.fetchAgreements( _email, status: "pending");
   await _fetchAgreements();
  }

  Future<void> _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('user_name') ?? '';
      _email = prefs.getString('user_email') ?? '';
      if (kDebugMode) {
        print("$_email  This is Load user info email funciton ");
      }

    });
  }


  Future<void> _fetchAgreements() async {
    final url = Uri.parse('https://nda.yourailist.com/api/getAgreements');
    final data;

    try {
      if (kDebugMode) {
        print("$_email this inside the Fetch Agreement function");
      }

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': _email,
          //'status': Status.complete.toString(),
          'status': "complete",
        }),
      );
      data = json.decode(response.body);

      if (response.statusCode == 200) {


        // Now extract the message



        List<dynamic> list = data['agreements'];
        setState(() {
          _agreements = list.map((e) => Agreement.fromJson(e)).toList();
          _loading = false;
        });

      } else {
        setState(() {

          _error = "${data['message']}";
          _loading = false;
        });
      }
    } catch (e) {
      print(e.toString());

      if (e is SocketException) {
        _loading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You are offline')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
     final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:  SvgPicture.asset('assets/page 21 image.svg'),
        titleSpacing: 90,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Center(
                child: Container(
                  width: screenSize.width-25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: ListTile(
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                       child: IconButton(onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) =>  ImagePickerPage()));
                       }, icon: const Icon(CupertinoIcons.person,size: 35,color: Colors.white,),),
                       // child: Icon(Icons.person,size: 35,),
                      //  backgroundImage: AssetImage('assets/qasim.png'),
                      ),
                    ),
                    title: Row(
                      children: [
                        SmallText(text: 'Good Morning', color: Colors.grey,size: 12,),
                        const SizedBox(width: 5,),
                        const Icon(Icons.waving_hand,color: Colors.yellow,size: 12,)
                      ],
                    ),
                   trailing: IconButton(onPressed: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => const SignaturePadPage()),
                     );
                   }, icon: Icon(Icons.notifications,color: Colors.grey.shade400,size: 25,),),
                   // trailing: const Icon(CupertinoIcons.bell),
                    subtitle:  Text(_name, style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),)
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                width: screenSize.width-25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Colors.grey.shade100),
                      borderRadius: BorderRadius.circular(15),
                      // Rounded border
                    ),
                    prefixIcon: Icon(CupertinoIcons.search,color: Colors.grey.shade400,),
                    hintText: 'Search',hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                  )
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                width: screenSize.width-25,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text("By using APP NDA, you've saved",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Color(0xFF474646),),),
                    ),
                    const SizedBox(height: 40,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       CircleAvatar(
                         radius: 33,
                         backgroundColor: Colors.black87,
                         child: Icon(CupertinoIcons.time_solid,color: Color(0xFF00C2FF),),
                       ) ,
                        CircleAvatar(
                          radius: 33,
                         backgroundColor: Colors.black87,
                         child: Icon(CupertinoIcons.film_fill,color: Color(0xFF00C2FF),),
                       ) ,
                        CircleAvatar(
                          radius: 33,
                         backgroundColor: Colors.black87,
                         child: Icon(CupertinoIcons.doc_plaintext,color: Color(0xFF00C2FF),),
                       )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Container(
               // height: 330,
                width: screenSize.width-10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("My Agreements",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.black),),
                          const SizedBox(width: 120,),
                          Text("View All",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xFF00C2FF)),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    _loading
                        ? const Center(child: CircularProgressIndicator())
                        : _error != null
                        ? Center(child: Text(" $_error",style: TextStyle(color: Colors.red),))
                        : SizedBox(
                        height: 220,
                          // height: 800,
                          child: ListView.builder(
                            itemCount: _agreements.length,
                            itemBuilder: (context, index) {
                          final agreement = _agreements[index];
                          return GestureDetector(
                            onTap: (){
                              if (kDebugMode) {
                                print(" tap ");
                              }
                              if (kDebugMode) {
                                print(agreement.id);
                              }
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>AgreementPage(id: agreement.id, mode: 'view',email:_email,)));

                              //AgreementService.fetchAgreement(agreement.id);
                            },
                            child: Container(
                              height: 70,

                              decoration: BoxDecoration(
                                  color: Color(0xFFF7F7F7),
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(child: Text(agreement.title, maxLines: 1,
                                            overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: Color(0xFF474646),),)),
                                          Text("#${agreement.id}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Color(0xFF838788),),),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(agreement.Agreement_Creatd_date,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Color(0xFF838788),),),
                                          Text("Completed",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 12,color: Color(0xFF454545),),),
                                        ],
                                      ),
                                    ),
                                   // Text(agreement.id as String),
                                    // ListTile(
                                    //   title:  Text(" ${agreement.title}"),
                                    //   subtitle: Text("sent  ${agreement.createdAt}"),
                                    //
                                    // ),
                                   // Text(" ${agreement.id}", style: TextStyle(fontWeight: FontWeight.bold)),


                                  ],
                                ),
                              ),
                            ),
                          );
                                                },
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




class ImageHelper {
  static const _key = 'profile_image_base64';

  // Save picked image as base64 string
  static Future<void> saveImage(Uint8List imageBytes) async {
    final prefs = await SharedPreferences.getInstance();
    final base64 = base64Encode(imageBytes);
    await prefs.setString(_key, base64);
  }

  // Load image bytes from SharedPreferences
  static Future<Uint8List?> loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final base64 = prefs.getString(_key);
    if (base64 == null) return null;
    return base64Decode(base64);
  }

  // Optional: Clear the saved image
  static Future<void> clearImage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}





class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  Uint8List? _imageBytes;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      Uint8List bytes;

      if (kIsWeb) {
        bytes = await pickedFile.readAsBytes();
      } else {
        bytes = await io.File(pickedFile.path).readAsBytes();
      }

      await ImageHelper.saveImage(bytes);
      setState(() {
        _imageBytes = bytes;
      });
    }
  }

  Future<void> _loadImage() async {
    final image = await ImageHelper.loadImage();
    setState(() {
      _imageBytes = image;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pick Profile Imagesjhkg"),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage:
              _imageBytes != null ? MemoryImage(_imageBytes!) : null,
              child: _imageBytes == null
                  ? const Icon(Icons.person, size: 60)
                  : null,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.photo),
              label: const Text("Pick from Gallery"),
              onPressed: () => _pickImage(ImageSource.gallery),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.camera_alt),
              label: const Text("Take Photo"),
              onPressed: () => _pickImage(ImageSource.camera),
            ),
          ],
        ),
      ),
    );
  }
}






class ProfileDisplayPage extends StatefulWidget {
  const ProfileDisplayPage({super.key});

  @override
  State<ProfileDisplayPage> createState() => _ProfileDisplayPageState();
}

class _ProfileDisplayPageState extends State<ProfileDisplayPage> {
  Uint8List? _imageBytes;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final image = await ImageHelper.loadImage();
    setState(() {
      _imageBytes = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Display")),
      body: Center(
        child: CircleAvatar(
          radius: 60,
          backgroundImage:
          _imageBytes != null ? MemoryImage(_imageBytes!) : null,
          child: _imageBytes == null
              ? const Icon(Icons.person, size: 50)
              : null,
        ),
      ),
    );
  }
}





















































// class ImagePickerPage extends StatefulWidget {
//   const ImagePickerPage({super.key});
//
//   @override
//   State<ImagePickerPage> createState() => _ImagePickerPageState();
// }
//
// class _ImagePickerPageState extends State<ImagePickerPage> {
//   File? _imageFile;
//   final ImagePicker _picker = ImagePicker();
//
//   Future<void> _pickImage(ImageSource source) async {
//     final XFile? pickedFile = await _picker.pickImage(source: source);
//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = File(pickedFile.path);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Image Picker")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _imageFile != null
//                 ? Image.file(_imageFile!, height: 300)
//                 : const Text("No image selected."),
//             const SizedBox(height: 20),
//             ElevatedButton.icon(
//               icon: const Icon(Icons.photo),
//               label: const Text("Pick from Gallery"),
//               onPressed: () => _pickImage(ImageSource.gallery),
//             ),
//             ElevatedButton.icon(
//               icon: const Icon(Icons.camera_alt),
//               label: const Text("Take a Photo"),
//               onPressed: () => _pickImage(ImageSource.camera),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//}



