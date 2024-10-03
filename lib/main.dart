import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/controller/Movie_Details_Cubit/cubit/detials_movie_cubit.dart';
import 'package:movies_app/controller/Page_Cubit/page_cubit.dart';
import 'package:movies_app/view/Home_Page/Home_Page.dart';
import 'controller/BlocObserver.dart';
import 'dependancy_Injection/service_DI.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDI();
  Bloc.observer = MyBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PageCubit(),
          ),
          BlocProvider(
            create: (context) => MoviesDetailsCubit(),
          ),
        ],
        child: HomePage(),
      ),

    );
  }
}
