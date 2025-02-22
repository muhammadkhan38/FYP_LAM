import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PropertyDealAgreementScreen extends StatefulWidget {
  @override
  _PropertyDealAgreementScreenState createState() =>
      _PropertyDealAgreementScreenState();
}

class _PropertyDealAgreementScreenState
    extends State<PropertyDealAgreementScreen> {
  final String defaultTemplate = '''
PROPERTY DEAL AGREEMENT

This Property Deal Agreement ("Agreement") is made on this [Insert Date], by and between:
• Seller’s Name: [Insert Seller’s Name], residing at [Insert Seller’s Address] ("Seller")
• Buyer’s Name: [Insert Buyer’s Name], residing at [Insert Buyer’s Address] ("Buyer")

WHEREAS, the Seller desires to sell the property located at [Insert Property Address], and the Buyer agrees to purchase the property under the terms and conditions set forth below, the parties hereby agree as follows:

1. Property Description
1.1. The property subject to this Agreement is located at [Insert Property Address] and is described as [Insert Property Description].
1.2. The property includes [Insert Property Details, e.g., land size, buildings, amenities, etc.].

2. Purchase Price and Payment Terms
2.1. The total purchase price of the property is [Insert Amount and Currency].
2.2. The Buyer agrees to pay the Seller the full purchase price in the following manner:
• A down payment of [Insert Amount and Currency] upon signing this Agreement.
• The remaining balance of [Insert Amount and Currency] will be paid on or before [Insert Closing Date].
2.3. Payments will be made via [Insert Payment Method, e.g., bank transfer, cheque, etc.].

3. Closing Date
3.1. The closing of the sale shall take place on [Insert Closing Date], at which point the Seller shall transfer the title of the property to the Buyer and the Buyer shall pay the remaining balance of the purchase price.
3.2. If either party is unable to meet the closing date, the other party may, at their discretion, extend the closing date for an additional [Insert Number of Days] days.

4. Title and Ownership
4.1. The Seller guarantees that the property is free from any encumbrances, liens, or disputes and has full legal ownership of the property.
4.2. The Seller agrees to provide the Buyer with all necessary documents to transfer the property title, including the deed of sale, clearances, and any other documents required by law.
4.3. The Buyer will assume full ownership of the property upon successful transfer of the title.

5. Condition of the Property
5.1. The Buyer has had the opportunity to inspect the property and agrees to purchase it in its current condition, "as is," unless otherwise agreed.
5.2. The Seller represents that the property is in good condition, free from any structural defects, hazardous materials, or major repairs, except for [Insert any known issues if applicable].
5.3. Any repairs, if agreed upon, shall be completed by [Insert Repair Completion Date].

6. Taxes and Fees
6.1. The Buyer shall be responsible for all taxes, registration fees, and other charges associated with the purchase of the property.
6.2. The Seller shall be responsible for any taxes related to the sale, including but not limited to capital gains taxes.

7. Risk and Insurance
7.1. The risk of loss or damage to the property shall pass to the Buyer once the full payment has been made, and ownership has been transferred.
7.2. The Buyer is responsible for insuring the property after the closing date.

8. Default
8.1. If the Buyer fails to make any payment as agreed, the Seller has the right to terminate this Agreement and retain any deposits paid as liquidated damages.
8.2. If the Seller fails to transfer ownership of the property as agreed, the Buyer may demand the return of any payments made or seek legal remedies.

9. Dispute Resolution
9.1. Any disputes arising from this Agreement shall be resolved through [Insert Dispute Resolution Method, e.g., Arbitration, Mediation, etc.].
9.2. The governing law of this Agreement shall be the laws of [Insert Jurisdiction, e.g., Country/State].

10. Entire Agreement
10.1. This Agreement represents the entire understanding between the parties and supersedes all prior agreements, negotiations, and communications.
10.2. Amendments to this Agreement must be made in writing and signed by both parties.

11. Severability
11.1. If any provision of this Agreement is found to be invalid or unenforceable, the remaining provisions shall remain in full force and effect.

12. Signatures
Seller:
Name: [Insert Seller’s Name]
Signature: ___________________
Date: [Insert Date]

Buyer:
Name: [Insert Buyer’s Name]
Signature: ___________________
Date: [Insert Date]
''';

  TextEditingController _controller = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadTemplate();
  }

  Future<void> loadTemplate() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTemplate = prefs.getString('propertyDealAgreement');
    setState(() {
      _controller.text = savedTemplate ?? defaultTemplate;
      isLoading = false;
    });
  }

  Future<void> saveTemplate() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('propertyDealAgreement', _controller.text);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Template saved successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Property Deal Agreement'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: saveTemplate,
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          maxLines: null,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Edit the property deal agreement template here...',
          ),
        ),
      ),
    );
  }
}
