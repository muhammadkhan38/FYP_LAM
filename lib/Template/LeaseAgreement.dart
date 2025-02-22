import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LeaseAgreementScreen extends StatefulWidget {
  const LeaseAgreementScreen({super.key});

  @override
  _LeaseAgreementScreenState createState() => _LeaseAgreementScreenState();
}

class _LeaseAgreementScreenState extends State<LeaseAgreementScreen> {
  final String defaultTemplate = '''
Lease Agreement

This Lease Agreement ("Agreement") is made on this [Insert Date], by and between [Landlord’s Name], with a principal address at [Landlord’s Address] ("Landlord"), and [Tenant’s Name], residing at [Tenant’s Address] ("Tenant").

WHEREAS, the Landlord agrees to lease, and the Tenant agrees to rent the property described herein under the terms and conditions set forth below, the parties hereby agree as follows:

1. Description of Property
1.1. The property is located at [Property Address].
1.2. The property includes [Describe any included furnishings or appliances].

2. Term
2.1. The lease term begins on [Start Date] and ends on [End Date], unless terminated earlier in accordance with this Agreement.
2.2. The Tenant has the option to [Renew/Not Renew] the lease upon expiration.

3. Rent
3.1. The monthly rent is [Insert Amount and Currency], payable on the [Insert Day] of each month.
3.2. Late payments may incur a penalty of [Insert Amount].

4. Security Deposit
4.1. The Tenant shall provide a security deposit of [Insert Amount] upon signing this Agreement.
4.2. The deposit will be returned within [Insert Time Period] after the lease ends, less any deductions for damages.

5. Maintenance and Repairs
5.1. The Landlord is responsible for repairs related to [Structural/Electrical/Plumbing Issues].
5.2. The Tenant is responsible for routine maintenance and minor repairs.

6. Termination
6.1. Either party may terminate this Agreement by providing [Insert Notice Period] written notice.
6.2. Termination due to breach must be preceded by written notice of the breach and a [Insert Time Period] cure period.

7. Dispute Resolution
7.1. Any disputes arising from this Agreement shall be resolved through [Arbitration/Litigation] under the laws of [Insert Jurisdiction].

8. Signatures
Landlord:
[Landlord’s Name]
[Landlord’s Signature]
Date: [Insert Date]

Tenant:
[Tenant’s Name]
[Tenant’s Signature]
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
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? savedTemplate = prefs.getString('leaseAgreement');
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

  Future<void> saveTemplate() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('leaseAgreement', _controller.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Template saved successfully!')),
      );
    } catch (e) {
      print('Error saving template: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving template!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lease Agreement'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: saveTemplate,
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
            hintText: 'Edit the lease agreement template here...',
          ),
        ),
      ),
    );
  }
}
