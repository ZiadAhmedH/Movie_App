import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:movies_app/controller/Movie_Cubit/Movie_Cubit.dart';
import 'package:movies_app/controller/Page_Cubit/page_cubit.dart';
import 'package:movies_app/view/Home_Page/Home_Page.dart';
import 'package:provider/provider.dart';

import 'controller/BlocObserver.dart';
import 'controller/Movie_Cubit/Movie_State.dart';
import 'controller/Movies_Repo.dart';
import 'view/Main_Page/Movie_Section/movies_list_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InheritedProvider(
      create: (context) => MoviesRepo(),
      child: MaterialApp(
        home: BlocProvider(
          create: (context) => PageCubit(),
          child:  HomePage(),
        ),

      ),
    );
  }
}
