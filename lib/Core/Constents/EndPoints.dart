class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3/movie/';
  static const String imageUrl = 'https://image.tmdb.org/t/p/w500';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/original';
  static const String apiKey = '?api_key=bc7fc4bfb4720e0547a7facf1b65ba21';

  static const String nowPlayingApi = '${baseUrl}now_playing$apiKey';
  static const String topRatedApi = '${baseUrl}top_rated$apiKey';
  static const String upcomingApi = '${baseUrl}upcoming$apiKey';
  static const String popularApi = '${baseUrl}popular';

  static const String recommendation = '/similar';
  static const String video = '/videos';

   static imageUr(String path) => '$imageUrl$path';
   static movieDetails(int id) => '$baseUrl$id$apiKey';
    static recommendationMovies(int id) => '$baseUrl$id$recommendation$apiKey';
}