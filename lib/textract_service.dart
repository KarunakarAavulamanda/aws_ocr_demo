import 'package:flutter/material.dart';
import 'package:aws_textract_api/textract-2018-06-27.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TextractService extends StatefulWidget {
  @override
  _TextractServiceState createState() => _TextractServiceState();
}

class _TextractServiceState extends State<TextractService> {
  final ImagePicker _picker = ImagePicker();
  String? _recognizedText;

  Future<void> _pickImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery); // Updated method
    if (pickedFile != null) {
      _performOCR(File(pickedFile.path));
    }
  }

  Future<void> _performOCR(File imageFile) async {
    final textract = Textract(
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: 'AKIA57VDLN2Q6CVNUKLS',
        secretKey: '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',
      ),
    );

    try {
      final response = await textract.detectDocumentText(
        document: Document(
          bytes: await imageFile.readAsBytes(),
        ),
      );

      final textBlocks =
          response.blocks?.where((block) => block.blockType == BlockType.line);
      _recognizedText =
          textBlocks?.map((e) => e.text).join('\n') ?? 'No text found';
      setState(() {});
    } catch (e) {
      print('Error: $e');
      setState(() {
        _recognizedText = 'Error occurred while processing the image.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AWS Textract OCR Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick an Image'),
            ),
            SizedBox(height: 20),
            if (_recognizedText != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _recognizedText!,
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
