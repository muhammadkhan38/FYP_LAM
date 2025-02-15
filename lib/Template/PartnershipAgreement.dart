import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PartnershipAgreementScreen extends StatefulWidget {
  @override
  _PartnershipAgreementScreenState createState() =>
      _PartnershipAgreementScreenState();
}

class _PartnershipAgreementScreenState
    extends State<PartnershipAgreementScreen> {
  final String defaultTemplate = '''
Partnership Agreement

This Partnership Agreement ("Agreement") is made on this [Insert Date], by and between [Partner 1 Name], residing at [Partner 1 Address], and [Partner 2 Name], residing at [Partner 2 Address] (collectively, "Partners").

WHEREAS, the Partners agree to form a partnership to conduct the business described herein under the terms and conditions set forth below, the parties hereby agree as follows:

1. Partnership Name and Purpose
1.1. The name of the partnership shall be [Partnership Name].
1.2. The purpose of the partnership is to engage in [Describe Business Activities].

2. Contributions
2.1. [Partner 1 Name] shall contribute [Description of Contributions, e.g., Capital, Assets, Skills].
2.2. [Partner 2 Name] shall contribute [Description of Contributions, e.g., Capital, Assets, Skills].

3. Profit and Loss Sharing
3.1. Profits and losses shall be shared in the following proportions:
• [Partner 1 Name]: [Insert Percentage]
• [Partner 2 Name]: [Insert Percentage]

4. Decision-Making
4.1. Major decisions require unanimous consent of the Partners.
4.2. Routine decisions may be made by majority vote.

5. Termination
5.1. This Agreement may be terminated by:
• Mutual agreement of the Partners.
• Withdrawal of a Partner with [Insert Notice Period] written notice.
• Bankruptcy or death of a Partner.

6. Dispute Resolution
6.1. Any disputes arising from this Agreement shall be resolved through [Arbitration/Litigation] under the laws of [Insert Jurisdiction].

7. Signatures
Partner 1:
[Partner 1 Name]
[Partner 1 Signature]
Date: [Insert Date]

Partner 2:
[Partner 2 Name]
[Partner 2 Signature]
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
      String? savedTemplate = prefs.getString('partnershipAgreement');
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
  //     await prefs.setString('partnershipAgreement', _controller.text);
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
        title: Text('Partnership Agreement'),
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
            hintText: 'Edit the partnership agreement template here...',
          ),
        ),
      ),
    );
  }
}
