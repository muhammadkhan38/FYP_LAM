import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SalesAgreementScreen extends StatefulWidget {
  @override
  _SalesAgreementScreenState createState() => _SalesAgreementScreenState();
}

class _SalesAgreementScreenState extends State<SalesAgreementScreen> {

  final String defaultTemplate = '''
Sales Agreement

This Sales Agreement ("Agreement") is made on this [Insert Date], by and between [Seller’s Name], with a principal address at [Seller’s Address] ("Seller"), and [Buyer’s Name], with a principal address at [Buyer’s Address] ("Buyer").

WHEREAS, the Seller agrees to sell, and the Buyer agrees to purchase the goods described herein under the terms and conditions set forth below, the parties hereby agree as follows:

1. Description of Goods
1.1. The goods to be sold are described as [Description of Goods].
1.2. Quantity: [Insert Quantity].
1.3. Condition: [New/Used/Other, specify].

2. Purchase Price
2.1. The total purchase price for the goods is [Insert Amount and Currency], payable as follows:
• Deposit: [Insert Amount] upon signing this Agreement.
• Balance: [Insert Amount] due on [Insert Date].

3. Delivery
3.1. The goods shall be delivered to [Delivery Address] on or before [Delivery Date].
3.2. Risk of loss transfers to the Buyer upon [Delivery/Shipment].

4. Warranties
4.1. The Seller warrants that the goods are free from any liens or encumbrances and conform to the agreed specifications.
4.2. The Buyer acknowledges that the goods are sold [As Is/With Limited Warranty].

5. Termination
5.1. Either party may terminate this Agreement in the event of a material breach by the other party.

6. Dispute Resolution
6.1. Any disputes arising under this Agreement shall be resolved through [Arbitration/Litigation] in accordance with the laws of [Insert Jurisdiction].

7. Signatures
Seller:
[Seller’s Name]
[Seller’s Signature]
Date: [Insert Date]

Buyer:
[Buyer’s Name]
[Buyer’s Signature]
Date: [Insert Date]
''';
@override
  void dispose(){
  _controller.dispose();
  super.dispose();
}
  TextEditingController _controller = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadTemplate();
  }

  Future<void> loadTemplate() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? savedTemplate = prefs.getString('salesAgreement');
      setState(() {
        _controller.text = savedTemplate ?? defaultTemplate;
        isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        _controller.text = defaultTemplate;
        isLoading = false;
      });
    }
  }

  // Future<void> saveTemplate() async {
  //   try {
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('salesAgreement', _controller.text);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Template saved successfully!')),
  //     );
  //   } catch (e) {
  //     print('Error saving template: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Error saving template!')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Agreement'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){},
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          maxLines: null,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Edit the sales agreement template here...',
          ),
        ),

      ),
    );
  }
}
