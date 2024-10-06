class Movie {
  final int id;
  final String? title;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final double? voteAverage;
  


  Movie({required this.backdropPath, required this.voteAverage, required this.id, required this.title, required this.overview, required this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      backdropPath: json['backdrop_path'],
      voteAverage: json['vote_average'].toDouble(),
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],


    );
  }
}
