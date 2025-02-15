import 'package:final_year_project/page34.dart';
import 'package:flutter/material.dart';

class Page30 extends StatelessWidget {
  const Page30({super.key});

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
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 130),
              child: Text(
                'Name of agreement',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
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
                  hintText: 'Enter the title for the agrement',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 49.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
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
              width: size.width - 10,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color(0xffDDF2F9)),
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff474646),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: '\t\tTake Picture ',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                              color: Colors.black),
                          children: [
                            TextSpan(
                                text: '(Optional)',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: Colors.grey)),
                          ],
                        ),
                      ),
                      const Text(
                        '\t\tAdding a picture will help in increase the legitimacy of the\n\t\tagreement ',
                        style: TextStyle(fontSize: 10),
                      ),
                      // Text('Adding a picture will help in increase the legitimacy of the')
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color(0xff00C2FF),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    'Previous',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Page34()));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blueAccent,
                    backgroundColor: Colors.blueAccent.shade400,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70, vertical: 16),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
