import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:movies_app/controller/movies_controller.dart';
import 'package:provider/provider.dart';

import 'controller/Movie_State.dart';
import 'controller/Movies_Repo.dart';
import 'view/movies_list_page.dart';

void main() {
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
        create: (context) => MovieCubit(
          context.read<MoviesRepo>(),
        )..fetchMovies(),
        child: MoviesScreen(),
      ),

    ),
    );

  }
}