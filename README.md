# ocr_demoaws

A new Flutter project.

## Configure AWS SDK
Set up the AWS SDK in your Flutter application:-

import 'package:aws_sdk/aws_sdk.dart';

final awsRegion = 'your-region'; // e.g., 'us-east-1'
final awsAccessKey = 'your-access-key';
final awsSecretKey = 'your-secret-key';

final awsClient = AwsClient(
  accessKey: awsAccessKey,
  secretKey: awsSecretKey,
  region: awsRegion,
);


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
