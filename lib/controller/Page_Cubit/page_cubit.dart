import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../view/Favorite_Page/favorite_movies_page.dart';
import '../../view/List_Page/ListFav_Movie_Page.dart';
import '../../view/Main_Page/Main_Page.dart';

part 'page_state.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit() : super(PageInitial());
  int currentIndex = 0;

  static PageCubit get(context) => BlocProvider.of(context);


  List pages = [const MainPage(), const ListMoviePage(), const FavoriteMoviesPage()];


  void changeIndex(int index) {
    currentIndex = index;
    emit(NavigationChangeIndexState(index));
  }



}


