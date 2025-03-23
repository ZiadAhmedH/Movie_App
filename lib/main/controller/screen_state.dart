part of 'screen_cubit.dart';


@immutable
abstract class ScreenState extends Equatable {
  const ScreenState();

  @override
  List<Object> get props => [];
}

class ScreenInitial extends ScreenState {}

class ScreenChanged extends ScreenState {
  final int index;

  const ScreenChanged({required this.index});

  @override
  List<Object> get props => [index];
}
