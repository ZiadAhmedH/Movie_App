import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/Movie/Presentation/controller/movies_bloc.dart';

import '../../../../dependancy_Injection/service_DI.dart';
import '../controller/movies_event.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesBloc(sl())..add(FetchPlayingNowMoviesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movies App'),
        ),
        body: Container(
          child: const Center(
            child: Text('Movies App'),
          ),
        ),
      ),
    );
  }
}
