import 'package:flutter/material.dart';

class Page39 extends StatefulWidget {
  const Page39({super.key});

  @override
  State<Page39> createState() => _Page39State();
}

class _Page39State extends State<Page39> {
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
                    'Edit Agreement',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.edit_calendar_rounded,
                        color: Colors.lightBlueAccent,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                "Title",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 8,
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
                  hintText: 'Non disclosure agreement title',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),

            //second text field
            const Padding(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                "Party 1",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 8,
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
                  hintText: 'Lorem party 1 name',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            //3rd text filed
            const Padding(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                "Party 2",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 8,
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
                  hintText: 'Lorem party 2 name',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: size.width - 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 48,
                      width: size.width - 40,
                      //width: 380,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xff474646)),
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'B',
                            style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'I',
                            style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'U',
                            style: TextStyle(
                              color: Colors.lightBlue,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.lightBlue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Icon(
                            Icons.menu_sharp,
                            color: Colors.lightBlue,
                          ),
                          Icon(
                            Icons.menu,
                            color: Colors.lightBlue,
                          ),
                          Icon(
                            Icons.menu_open_outlined,
                            color: Colors.lightBlue,
                          ),
                          Icon(
                            Icons.menu,
                            color: Colors.lightBlue,
                          ),
                          //IconButton(onPressed: (){}, icon: const Icon(Icons.menu_outlined,color: Colors.lightBlue,)),
                          // IconButton(onPressed: (){}, icon: const Icon(Icons.menu_open,color: Colors.lightBlue,)),
                          // IconButton(onPressed: (){}, icon: const Icon(Icons.menu_sharp,color: Colors.lightBlue,)),
                          // IconButton(onPressed: (){}, icon: const Icon(Icons.menu,color: Colors.lightBlue,)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '1. Purpose',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'The purpose of this Agreement is to outline the terms and conditions for'
                      'the branding and web design services to be provided by Contractor to'
                      'Client.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '2. Scope of work',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Contractor will provide the following services to Client:',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '• Branding services, including brand strategy consultation,logo ,',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '\t\t design brand guidelines, and any other branding materials as agreed ',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '\t\t  upon by both parties.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '• Web design services, including the design and development of a new ',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '\t\t website for the Client.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      ' 3. Deliverables',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      ' Contractor will deliver the following to Client:',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '\t\t •  A completed, fully-functional website.',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '\t\t •  All source files for the website, including design files and code.',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '\t\t •  Any branding materials as agreed upon by both parties.',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '4. Payment and Ongoing costs',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'The Client will pay the Contractor the total agreed sum, outlined in the project package,'
                      'for the completion of the scope of work outlined in this Agreement.'
                      'This fee shall be paid in the following installments.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '\t\t •  50% payment due on acceptance of agreement',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '\t\t •  25% payment due on completion of brand design work',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '\t\t •  25% payment due on completion of web design work',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '4.1 Ongoing costs',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Client will be responsible for any ongoing subscription costs associated with the website,'
                      ' including hosting and any necessary updates or maintenance.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '5. Terms',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'This Agreement will begin on the date of acceptance and will remain in effect until all '
                          'services have been completed.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),




                  const SizedBox(height: 10,),

                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '6. Termination',
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Either party may terminate this Agreement at any time, for any reason, with written '
                          'notice to the other party. Upon termination, Contractor will deliver all final '
                          'deliverables to Client and will be paid for all work completed up to the date '
                          'of termination.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '7. Lawsuits',
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Any legal action arising out of or in connection with this Agreement '
                          'will be brought in the courts of New Zealand. The parties agree to '
                          'the exclusive jurisdiction of these courts.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),


                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '8. Intellectual property',
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'All intellectual property created by Contractor in the course of providing the services '
                          'described in this Agreement will be owned by Client. Contractor agrees to assign all'
                          ' intellectual property rights to Client upon completion of the services.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Contractor may showcase the work completed for Client in their portfolio and social'
                          ' media, provided that any confidential information is not disclosed in accordance '
                          'with the Confidentiality clause of this Agreement.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '9. Confidentiality',
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Contractor agrees to keep all information provided by Client, including but not '
                          'limited to business plans, financial information, marketing strategies, and any '
                          'other proprietary or confidential information, strictly confidential and will not '
                          'disclose any such information to any third parties without the prior written consent '
                          'of Client. This obligation of confidentiality will continue to apply even after the termination of this Agreement.'
                          ' Contractor will use commercially reasonable efforts to protect the confidentiality '
                          'of the confidential information, including implementing appropriate security measures and limiting '
                          'access to authorized personnel only',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Contractor may only use the confidential information for the purpose of completing the'
                          ' services described in this Agreement and will not use the confidential information '
                          'for any other purpose without the prior written consent of Client.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Contractor may only disclose the confidential information as required by '
                          'law or legal process, provided that Contractor promptly informs Client of'
                          ' such requirement and cooperates with Client in any efforts to seek a protective'
                          ' order or other appropriate remedy.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '10. Revision cycles',
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Client will have the opportunity to provide feedback and request '
                          'revisions during the design and development process. Contractor'
                          ' will make reasonable efforts to incorporate such feedback and'
                          ' revisions, but reserves the right to make the final decisions '
                          'on design and functionality.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),







                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      '11. Force Majeure',
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      'Neither party will be responsible for any delay or failure to perform due to causes beyond its reasonable control,'
                          ' such as acts of God, war, terrorism, riots, natural disasters, or government actions.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      '12. Warranties',
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      'Contractor warrants that the services provided under this Agreement will be performed in '
                          'a professional and competent manner. If the website is damaged due to an incident of hacking or '
                          'some other malware beyond the scope of Contractor'
                          's services, Client will be responsible for '
                          'paying for any necessary repairs',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      '13. General',
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      '13.1 Assignment',
                      style:
                      TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      'This Contract applies only to the Client and the Contractor.'
                          ' The Contractor cannot assign its rights or delegate its obligations under this Contract to a third-party '
                          '(other than by will or intestate), without first receiving the Client’s written permission. In contrast,'
                          ' the Client may assign its rights and delegate its obligations under this Contract without the Contractor'
                          's permission. This is necessary in case,'
                          ' for example, another Client buys out the Client or if the Client decides to sell the work product that results from this Contract.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      '13.2 Arbitration ',
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      'As the exclusive means of initiating adversarial proceedings to'
                          ' resolve any dispute arising under this Contract, a party may demand that '
                          'the dispute be resolved by arbitration administered by the American Arbitration'
                          ' Association in accordance with its commercial arbitration rules.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      '13.3 Modification; Waiver.',
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      'To change anything in this Contract, the Client and the Contractor must agree'
                          ' to that change in writing and sign a document showing their contract. Neither party '
                          'can waive its rights under this Contract or release the other party from its obligations '
                          'under this Contract, unless the waiving party acknowledges it is doing so in writing and'
                          ' signs a document that says so.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      '13.4 Notices.',
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      '(a) Over the course of this Contract, one party may need to'
                          ' send a notice to the other party. For the notice to be valid, it must'
                          ' be in writing and delivered in one of the following ways: personal delivery,'
                          ' email, or certified or registered mail (postage prepaid, return receipt requested). '
                          'The notice must be delivered to the party’s address listed at the end of this Contract '
                          'or to another address that the party has provided in writing as an appropriate address to'
                          ' receive notice',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      '(b) The timing of when a notice is received can be very important.'
                          ' To avoid confusion, a valid notice is considered received as follows:'
                          ' (i) if delivered personally, it is considered received immediately; ',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '(ii) if delivered by email, it is considered received upon acknowledgement of receipt;'
                          ' (iii) if delivered by registered or certified mail (postage prepaid, return receipt requested),'
                          ' it is considered received upon receipt as indicated by the date on the signed receipt. '
                          'If a party refuses to accept notice or if notice cannot be delivered because of a change'
                          ' in address for which no notice was given, then it is considered received when the notice '
                          'is rejected or unable to be delivered. If the notice is received after 5:00pm on a business '
                          'day at the location specified in the address for that party, or on a day that is not a business day,'
                          ' then the notice is considered received at 9:00am on the next business day.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '13.5 Severability',
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'This section deals with what happens if a portion of the Contract is'
                          ' found to be unenforceable. If that’s the case, the unenforceable portion will'
                          ' be changed to the minimum extent necessary to make it enforceable, unless that change '
                          'is not permitted by law, in which case the portion will be disregarded. If any portion of'
                          ' the Contract is changed or disregarded because it is unenforceable, the rest of the Contract '
                          'is still enforceable.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '13.6 Signatures ',
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'The Client and the Contractor must sign this document using an e-signing system.'
                          ' These electronic signatures count as originals for all purposes.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),


                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60,),

            ElevatedButton(
              onPressed: () {
               // Navigator.push(context, MaterialPageRoute(builder: (context) => const Page39()));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blueAccent,
                // backgroundColor: Colors.blueAccent.shade400,
                backgroundColor: const Color.fromRGBO(15, 104, 251, 1),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
              ),
              child: const Text(
                'Done',
                style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
