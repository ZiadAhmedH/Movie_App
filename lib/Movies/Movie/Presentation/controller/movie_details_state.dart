part of 'movie_details_bloc.dart';

 class MovieDetailsState extends Equatable {

    const MovieDetailsState(
    {
      this.movieDetails = const MovieDetails(
        id: 0,
        title: '',
        backdropPath: '',
        genres: [],
        overview: '',
        releaseDate: '',
        runtime: 0,
        voteAverage: 0.0, posterPath: '',
      ),
      this.movieDetailsState = RequestState.loading,
      this.movieDetailsMessage = '',

      this.recommendations = const [],
      this.recommendationsState = RequestState.loading,
      this.recommendationsMessage = '',
    }
    );

      final MovieDetails? movieDetails;
      final RequestState movieDetailsState;
      final String movieDetailsMessage;

      final List<Recommendation> recommendations;

      final RequestState recommendationsState;

      final String recommendationsMessage;


      MovieDetailsState copyWith({
        MovieDetails? movieDetails,
        RequestState? movieDetailsState,
        String? movieDetailsMessage,
        List<Recommendation>? recommendations,
        RequestState? recommendationsState,
        String? recommendationsMessage,
      }) {
        return MovieDetailsState(
          movieDetails: movieDetails ?? this.movieDetails,
          movieDetailsState: movieDetailsState ?? this.movieDetailsState,
          movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
          recommendations: recommendations ?? this.recommendations,
          recommendationsState: recommendationsState ?? this.recommendationsState,
          recommendationsMessage: recommendationsMessage ?? this.recommendationsMessage,
        );
      }



    @override
    List<Object> get props => [
      movieDetails!,
      movieDetailsState,
      movieDetailsMessage,
      recommendations,
      recommendationsState,
      recommendationsMessage,
    ];
}
