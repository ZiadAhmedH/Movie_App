class Movie {
  final int id;
  final String title;
  final String imageUrl;
  final String backgroundImageUrl;
  final int year;
  final double rating;
  final int runtime;
  final bool isFavorite;
  final bool isWatched;
  final bool is3DMovie; // New property to indicate if it's a 3D movie

  Movie({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.backgroundImageUrl,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.isFavorite,
    required this.isWatched,
    required this.is3DMovie,  // Include is3DMovie in constructor
  });

  Movie copyWith({
    int? id,
    String? title,
    String? imageUrl,
    String? backgroundImageUrl,
    int? year,
    double? rating,
    int? runtime,
    bool? isFavorite,
    bool? isWatched,
    bool? is3DMovie, // Add is3DMovie to copyWith
  }) =>
      Movie(
        id: id ?? this.id,
        title: title ?? this.title,
        imageUrl: imageUrl ?? this.imageUrl,
        backgroundImageUrl: backgroundImageUrl ?? this.backgroundImageUrl,
        year: year ?? this.year,
        rating: rating ?? this.rating,
        runtime: runtime ?? this.runtime,
        isFavorite: isFavorite ?? this.isFavorite,
        isWatched: isWatched ?? this.isWatched,
        is3DMovie: is3DMovie ?? this.is3DMovie,  // Copy the new field
      );

  @override
  String toString() =>
      "Movie(id: $id, title: $title, imageUrl: $imageUrl, isFavorite: $isFavorite, isWatched: $isWatched, is3DMovie: $is3DMovie)";

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
              isFavorite == other.isFavorite &&
              isWatched == other.isWatched &&
              is3DMovie == other.is3DMovie; // Update equality check

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      imageUrl.hashCode ^
      backgroundImageUrl.hashCode ^
      year.hashCode ^
      rating.hashCode ^
      runtime.hashCode ^
      isFavorite.hashCode ^
      isWatched.hashCode ^
      is3DMovie.hashCode; // Update hashCode
}
