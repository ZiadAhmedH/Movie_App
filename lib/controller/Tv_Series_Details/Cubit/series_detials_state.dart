// create a class called DetailsMovieState
import 'package:equatable/equatable.dart';
import 'package:movies_app/controller/Tv_Series_Details/Data/Models/Series_Details_Model.dart';

class SeriesDetailsState extends Equatable {
  final SeriesDetails seriesDetails;
   SeriesDetailsState({required this.seriesDetails});

  @override
  List<Object> get props => [seriesDetails];

}

class  DetailsSeriesStateInitial extends SeriesDetailsState {
  DetailsSeriesStateInitial() : super(seriesDetails: SeriesDetails());
}

class  DetailsSeriesStateLoading extends SeriesDetailsState {
  DetailsSeriesStateLoading() : super(seriesDetails: SeriesDetails());
}

class  DetailsSeriesStateLoaded extends SeriesDetailsState {
  DetailsSeriesStateLoaded({required SeriesDetails seriesDetails}) : super(seriesDetails: seriesDetails);
}

class  DetailsSeriesStateError extends SeriesDetailsState {
  final String error;

  DetailsSeriesStateError({required this.error}) : super(seriesDetails: SeriesDetails());
}
