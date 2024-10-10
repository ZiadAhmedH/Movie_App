part of 'series_detials_cubit.dart';

@immutable
abstract class SeriesDetialsState {}

class SeriesDetialsInitial extends SeriesDetialsState {}

class SeriesDetialsLoading extends SeriesDetialsState {}

class SeriesDetialsLoaded extends SeriesDetialsState {
  final SeriesDetails seriesDetails;

  SeriesDetialsLoaded({required this.seriesDetails});
}

class SeriesDetialsError extends SeriesDetialsState {
  final String error;

  SeriesDetialsError({required this.error});
}


