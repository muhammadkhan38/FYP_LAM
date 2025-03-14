import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Page52 extends StatefulWidget {
  const Page52({super.key});

  @override
  State<Page52> createState() => _Page52State();
}

class _Page52State extends State<Page52> {
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
                  IconButton(onPressed: (){}, icon: const Icon(Icons.confirmation_num_sharp,color: Colors.lightBlueAccent,))
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
            const SizedBox(
              height: 15,
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
                        color: const Color(0xff474646)),
                    child: const Center(
                        child: Text(
                          'Parties',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size.width - 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xffF7F7F7),
                    ),
                    child: Column(
                      children: [
                        const ListTile(
                          leading: Text(
                            'First Party',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          trailing: Text(
                            'Auto Fill',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                                color: Color(0xff00C2FF),
                                decoration: TextDecoration.underline,
                                decorationThickness: 3,
                                decorationColor: Color(0xff00C2FF)),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          endIndent: 20,
                          indent: 20,
                          height: 0,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 155),
                          child: Text(
                            '1’st party name',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        const Text(
                          '(could be an individual, company, corporation)',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w100),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          width: size.width - 40,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              filled: false,
                              fillColor: Color(0xffFFFFFF),
                              hintText: 'Name',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 49.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 140),
                          child: Text(
                            'Mailing address',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          width: size.width - 40,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              filled: false,
                              fillColor: Color(0xffFFFFFF),
                              hintText: 'Enter mailing address',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 49.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: size.width - 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xffF7F7F7),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        const ListTile(
                            leading: Text(
                              'Second Party',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            )),
                        const Divider(
                          thickness: 1,
                          endIndent: 20,
                          indent: 20,
                          height: 0,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: size.width - 40,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff00C2FF),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.card_membership,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                              const VerticalDivider(
                                thickness: 1,
                                indent: 10,
                                endIndent: 10,
                                color: Colors.white,
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.qr_code,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                onPressed: () {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ClipPath(
                                        child: SizedBox(
                                          height: 160,
                                          width: size.width,
                                          child: Column(
                                            children: <Widget>[
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                  'Please select scan type'),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Divider(
                                                thickness: 1,
                                                endIndent: 20,
                                                indent: 20,
                                                height: 0,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          15),
                                                      color: const Color(
                                                          0xff00C2FF),
                                                    ),
                                                    height: 100,
                                                    width: 105,
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        IconButton(
                                                            onPressed: () {},
                                                            icon: const Icon(
                                                              Icons
                                                                  .card_giftcard,
                                                              size: 40,
                                                              color:
                                                              Colors.white,
                                                            )),
                                                        const Text('Scan ID')
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(15),
                                                      color: const Color(
                                                          0xff474646),
                                                    ),
                                                    height: 100,
                                                    width: 105,
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        IconButton(
                                                          onPressed: () {},
                                                          icon: const Icon(
                                                            Icons.qr_code,
                                                            size: 40,
                                                            color: Colors.white,
                                                          ),
                                                          splashRadius: 30,
                                                        ),
                                                        const Text(
                                                          'Scan QR',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff00C2FF)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              const Text(
                                'Scan ID or Qr code',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 155),
                          child: Text(
                            '1’st party name',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        const Text(
                          '(could be an individual, company, corporation)',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w100),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          width: size.width - 40,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              filled: false,
                              fillColor: Color(0xffFFFFFF),
                              hintText: 'Name',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 49.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 140),
                          child: Text(
                            'Mailing address',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          width: size.width - 40,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              filled: false,
                              fillColor: Color(0xffFFFFFF),
                              hintText: 'Enter mailing address',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 49.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
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
                   Divider(
                    thickness: 1,
                    endIndent: 20,
                    indent: 20,
                    height: 0,
                  ),
                  SizedBox(height: 15,),

                  Center(child: Text('Read More',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700,color: Color(0xff00C2FF)),)),
                  SizedBox(
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
                  SizedBox(
                    width: size.width-40,
                    height: 57,
                    child: ElevatedButton(
                      onPressed: () {
                        _showAgreementDialog(context);
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
  Widget _buildRadioOption(Size size, String title, IconData icon, Color colors ) {
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
  void _showAgreementDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child:SizedBox(
            height: 340,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20,),
                Container(

                  decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blueAccent, // Border color
                      width: 7.0, // Border width
                    ),

                  ),

                  child: const CircleAvatar(
                    radius: 60,

                    backgroundColor: Color(0xff00C2FF),
                    child: Padding(
                      padding: EdgeInsets.only(left: 55.0,bottom: 49),
                      child: Icon(Icons.check,size: 80,),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                const Text('Agreement Sent',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                const SizedBox(height: 5,),
                const Text('Your Agreement have been successfully Sent to',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400),),
                const Text('LOREM IPSUM NAME',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xff1268FB)),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blueAccent,
                    // backgroundColor: Colors.blueAccent.shade400,
                    backgroundColor: const Color.fromRGBO(15, 104, 251, 1),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                  ),
                  child: const Text(
                    'Back to Home',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),

        );
      },
    );
  }
}

