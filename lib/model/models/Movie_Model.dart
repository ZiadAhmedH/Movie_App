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
      );

  @override
  String toString() =>
      "Movie(id: $id, title: $title, imageUrl: $imageUrl, isFavorite: $isFavorite, isWatched: $isWatched)";

  @override
  operator ==(o) =>
      o is Movie &&
          o.id == id &&
          o.title == title &&
          o.imageUrl == imageUrl &&
          o.backgroundImageUrl == backgroundImageUrl &&
          o.year == year &&
          o.rating == rating &&
          o.runtime == runtime &&
          o.isFavorite == isFavorite &&
          o.isWatched == isWatched;


}