import 'package:flutter/material.dart';
import 'Movies/Movie/Presentation/screens/movies_screen.dart';
import 'dependancy_Injection/service_DI.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      home: MoviesScreen(),

    );
  }
}
