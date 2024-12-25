import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/controller/Page_Cubit/page_cubit.dart';
import 'package:movies_app/controller/Tv_Series_Details/Data/local/Hive_Series_Database.dart';
import 'package:movies_app/view/Home_Page/Home_Page.dart';
import 'Movies/Movie_Details_Cubit/Data/Local/Hive_Movie_Database.dart';
import 'controller/BlocObserver.dart';
import 'dependancy_Injection/service_DI.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDI();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      home: HomePage(),

    );
  }
}
