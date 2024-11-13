import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/controller/Page_Cubit/page_cubit.dart';
import 'package:movies_app/view/Home_Page/Home_Page.dart';
import 'controller/BlocObserver.dart';
import 'controller/Movie_Details_Cubit/Data/Local/Hive_Movie.dart';
import 'dependancy_Injection/service_DI.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDI();
  HiveDatabase.initHive();
  Bloc.observer = MyBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movies App',
        home: HomePage(),

      ),
    );
  }
}
