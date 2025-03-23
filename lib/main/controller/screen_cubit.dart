import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/Movies/Movie/Presentation/controller/movie_bloc/movies_bloc.dart';
import 'package:movies_app/Movies/Movie/Presentation/screens/search_screen.dart';

import '../../Movies/Movie/Presentation/screens/movies_screen.dart';
import '../../dependancy_Injection/service_DI.dart';

part 'screen_state.dart';

class ScreenCubit extends Cubit<ScreenState> {
  ScreenCubit() : super(ScreenInitial());


  List<Widget> screens = [
    const MoviesScreen(),
    BlocProvider(
      create: (context) => sl<MoviesBloc>(),
      child: const SearchScreen(),
    ),
  ];

  void changeScreen(int index) {
    emit(ScreenChanged(index: index));
  }
}
