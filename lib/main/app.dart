import 'package:flutter/material.dart';
import 'package:movies_app/main/presentation/main_screen.dart';
import '../Movies/Movie/Presentation/screens/movies_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      home: const MainScreen(),
    );
  }
}
