part of 'page_cubit.dart';

@immutable
abstract class PageState {}

class PageInitial extends PageState {}


class NavigationChanged extends PageState {}

class NavigationChangeIndexState extends PageState {
  final int currentIndex;

  NavigationChangeIndexState(this.currentIndex);
}
