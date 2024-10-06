 // create a class called DetailsMovieState
import 'package:equatable/equatable.dart';

import '../Data/Models/Movie_Deatails_Model.dart';

class DetailsMovieState extends Equatable {
  final MovieDetails movieDetails;

  DetailsMovieState({required this.movieDetails});

  @override
  List<Object> get props => [movieDetails];

}

 class  DetailsMovieStateInitial extends DetailsMovieState {
   DetailsMovieStateInitial() : super(movieDetails: MovieDetails());
 }

// create a class called MovieDetailsCubit

  class  DetailsMovieStateLoading extends DetailsMovieState {
    DetailsMovieStateLoading() : super(movieDetails: MovieDetails());
  }

  class  DetailsMovieStateLoaded extends DetailsMovieState {
    DetailsMovieStateLoaded({required MovieDetails movieDetails}) : super(movieDetails: movieDetails);
  }

  class  DetailsMovieStateError extends DetailsMovieState {
    final String error;

    DetailsMovieStateError({required this.error}) : super(movieDetails: MovieDetails());
  }

