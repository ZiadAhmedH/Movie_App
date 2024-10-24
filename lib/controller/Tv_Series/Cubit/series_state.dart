import 'package:equatable/equatable.dart';
import 'package:movies_app/controller/Tv_Series/Data/Models/Series_Model.dart';

abstract class SeriesState extends Equatable {
  const SeriesState();

  @override
  List<Object?> get props => [];
}

class SeriesInitial extends SeriesState {}

class SeriesLoading extends SeriesState {}

class SeriesLoaded extends SeriesState {
  final List<Series> seriesList;
  final bool hasMoreSeries;
  final bool isLoading;

  const SeriesLoaded({
    required this.seriesList,
    this.hasMoreSeries = true,
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [seriesList, hasMoreSeries, isLoading];
}

class SeriesError extends SeriesState {
  final String error;

  const SeriesError(this.error);

  @override
  List<Object?> get props => [error];
}
