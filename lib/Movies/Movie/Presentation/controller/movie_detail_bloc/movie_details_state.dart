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


      this.cast = const [],
      this.castState = RequestState.loading,
      this.castMessage = '',
    }
    );

      final MovieDetails? movieDetails;
      final RequestState movieDetailsState;
      final String movieDetailsMessage;

      final List<Recommendation> recommendations;
      final RequestState recommendationsState;
      final String recommendationsMessage;


      final List<Cast> cast;
      final RequestState castState;
      final String castMessage;

      MovieDetailsState copyWith({
        MovieDetails? movieDetails,
        RequestState? movieDetailsState,
        String? movieDetailsMessage,
        List<Recommendation>? recommendations,
        RequestState? recommendationsState,
        String? recommendationsMessage,
        List<Cast>? cast,
        RequestState? castState,
        String? castMessage,
      }) {
        return MovieDetailsState(
          movieDetails: movieDetails ?? this.movieDetails,
          movieDetailsState: movieDetailsState ?? this.movieDetailsState,
          movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
          recommendations: recommendations ?? this.recommendations,
          recommendationsState: recommendationsState ?? this.recommendationsState,
          recommendationsMessage: recommendationsMessage ?? this.recommendationsMessage,
          cast: cast ?? this.cast,
          castState: castState ?? this.castState,
          castMessage: castMessage ?? this.castMessage,
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
      cast,
      castState,
      castMessage,
    ];
}
