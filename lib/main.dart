import 'package:flutter/material.dart';
import 'main/app.dart';
import 'main/app_initializer.dart';

Future<void> main() async {
  await initializeApp();
  runApp(const MainApp());
}