import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart'; // ✅ Add this

class SignaturePadPage extends StatefulWidget {
  const SignaturePadPage({super.key});

  @override
  State<SignaturePadPage> createState() => _SignaturePadPageState();
}

class _SignaturePadPageState extends State<SignaturePadPage> {
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
  );
  String? savedFilePath;

  Future<void> _saveSignatureLocally() async {
    if (_signatureController.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Signature is empty")),
      );
      return;
    }

    try {
      // ✅ Request storage permission
      var status = await Permission.storage.request();
      if (!status.isGranted) {
        //print("Muhammad khan landikotal storage permission denied the lkasdjf;lajksdf"+savedFilePath!);

        ScaffoldMessenger.of(context).showSnackBar(

          const SnackBar(content: Text("Storage permission denied")),
        );
        return;
      }

      // Convert signature to image
      final image = await _signatureController.toImage();
      final byteData = await image!.toByteData(format: ImageByteFormat.png);
      final Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Save to local storage
      final directory = await getApplicationDocumentsDirectory(); // or getExternalStorageDirectory()
      final filePath = '${directory.path}/signature_${DateTime.now().millisecondsSinceEpoch}.png';
      final file = File(filePath);
      await file.writeAsBytes(pngBytes);

      setState(() {
        savedFilePath = filePath;
        print(savedFilePath);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Signature saved at $filePath")),
      );
    } catch (e) {
      if (kDebugMode) {
        print("Error saving signature: $e");
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to save signature")),
      );
    }
  }

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Signature Pad")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Signature(
                controller: _signatureController,
                backgroundColor: Colors.white,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text("Save"),
                onPressed: _saveSignatureLocally,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.clear),
                label: const Text("Clear"),
                onPressed: () => _signatureController.clear(),
              ),
            ],
          ),
          if (savedFilePath != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Saved at:\n$savedFilePath", textAlign: TextAlign.center),
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
