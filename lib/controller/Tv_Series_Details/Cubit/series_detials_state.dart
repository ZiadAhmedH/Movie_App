import 'package:equatable/equatable.dart';
import '../Data/Models/Series_Details_Model.dart';

abstract class SeriesDetailsState extends Equatable {
  final SeriesDetails seriesDetails;

  const SeriesDetailsState({required this.seriesDetails});

  @override
  List<Object> get props => [seriesDetails];
}

// Initial State
class DetailsSeriesStateInitial extends SeriesDetailsState {
  DetailsSeriesStateInitial() : super(seriesDetails: SeriesDetails());
}

// Loading State
class DetailsSeriesStateLoading extends SeriesDetailsState {
  DetailsSeriesStateLoading() : super(seriesDetails: SeriesDetails());
}

// Loaded State with Favorite Status
class DetailsSeriesStateLoaded extends SeriesDetailsState {
  final bool isFav;

  const DetailsSeriesStateLoaded({
    required SeriesDetails seriesDetails,
    required this.isFav,
  }) : super(seriesDetails: seriesDetails);

  DetailsSeriesStateLoaded copyWith({
    SeriesDetails? seriesDetails,
    bool? isFav,
  }) {
    return DetailsSeriesStateLoaded(
      seriesDetails: seriesDetails ?? this.seriesDetails,
      isFav: isFav ?? this.isFav,
    );
  }

  @override
  List<Object> get props => [seriesDetails, isFav];
}

// Error State
class DetailsSeriesStateError extends SeriesDetailsState {
  final String error;

  const DetailsSeriesStateError({required this.error})
      : super(seriesDetails: const SeriesDetails());

  @override
  List<Object> get props => [seriesDetails, error];
}
