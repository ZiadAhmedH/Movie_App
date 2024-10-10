part of 'series_cubit.dart';

@immutable
abstract class SeriesState {}

class SeriesInitial extends SeriesState {}

class SeriesLoading extends SeriesState {}

class SeriesLoaded extends SeriesState {
  final List<Series> seriesList;

  SeriesLoaded(this.seriesList);
}

class SeriesError extends SeriesState {
  final String message;

  SeriesError(this.message);
}


