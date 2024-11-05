import 'package:flutter/material.dart';
import 'package:ocr_demoaws/textract_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AWS Textract OCR Demo',
      home: TextractService(),
    );
  }
}
