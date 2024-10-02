class Movie {
  final int id;
  final String title;
  final String imageUrl;
  final String backgroundImageUrl;
  final int year;
  final double rating;
  final int runtime;
  final List<String> genres; // Added genres field
  final bool isFavorite;
  final bool isWatched;


  Movie({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.backgroundImageUrl,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres, // Added genres to constructor
    required this.isFavorite,
    required this.isWatched,
  });

  Movie copyWith({
    int? id,
    String? title,
    String? imageUrl,
    String? backgroundImageUrl,
    int? year,
    double? rating,
    int? runtime,
    List<String>? genres, // Added genres to copyWith
    bool? isFavorite,
    bool? isWatched,
  }) =>
      Movie(
        id: id ?? this.id,
        title: title ?? this.title,
        imageUrl: imageUrl ?? this.imageUrl,
        backgroundImageUrl: backgroundImageUrl ?? this.backgroundImageUrl,
        year: year ?? this.year,
        rating: rating ?? this.rating,
        runtime: runtime ?? this.runtime,
        genres: genres ?? ["No Genres"], // Added genres in copyWith
        isFavorite: isFavorite ?? this.isFavorite,
        isWatched: isWatched ?? this.isWatched,
      );

  @override
  String toString() =>
      "Movie(id: $id, title: $title, imageUrl: $imageUrl, genres: $genres, isFavorite: $isFavorite, isWatched: $isWatched)"; // Updated toString

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Movie &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              title == other.title &&
              imageUrl == other.imageUrl &&
              backgroundImageUrl == other.backgroundImageUrl &&
              year == other.year &&
              rating == other.rating &&
              runtime == other.runtime &&
              genres == other.genres && // Added genres in equality check
              isFavorite == other.isFavorite &&
              isWatched == other.isWatched;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      imageUrl.hashCode ^
      backgroundImageUrl.hashCode ^
      year.hashCode ^
      rating.hashCode ^
      runtime.hashCode ^
      genres.hashCode ^ // Added genres in hashCode
      isFavorite.hashCode ^
      isWatched.hashCode;
}
