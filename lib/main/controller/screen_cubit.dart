import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/Movies/Movie/Presentation/screens/search_screen.dart';

import '../../Movies/Movie/Presentation/screens/movies_screen.dart';

part 'screen_state.dart';

class ScreenCubit extends Cubit<ScreenState> {
  ScreenCubit() : super(ScreenInitial());


  List<Widget> screens = [
    const MoviesScreen(),
    const SearchScreen(),
  ];

  void changeScreen(int index) {
    emit(ScreenChanged(index: index));
  }
}
