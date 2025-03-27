class ApiMovie {
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
    static movieCast(int id) => '$baseUrl$id/credits$apiKey';
    static searchMovie(String query) => 'https://api.themoviedb.org/3/search/movie$apiKey&query=$query';
    static movieVideo(int id) => '$baseUrl$id$video$apiKey';

}


class ApiTv {
  static const String baseUrl = 'https://api.themoviedb.org/3/tv/';
  static const String imageUrl = 'https://image.tmdb.org/t/p/w500';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/original';
  static const String apiKey = '?api_key=bc7fc4bfb4720e0547a7facf1b65ba21';

  static const String popularApi = '${baseUrl}popular$apiKey';
  static const String topRatedApi = '${baseUrl}top_rated$apiKey';
  static const String airingTodayApi = '${baseUrl}airing_today$apiKey';
  static const String onTheAirApi = '${baseUrl}on_the_air$apiKey';

  static const String recommendation = '/similar';
  static const String video = '/videos';

   static const String trendingApi = 'https://api.themoviedb.org/3/trending/tv/day$apiKey';



   static imageUr(String path) => '$imageUrl$path';
   static tvDetails(int id) => '$baseUrl$id$apiKey';
    static recommendationTv(int id) => '$baseUrl$id$recommendation$apiKey';
    static tvCast(int id) => '$baseUrl$id/credits$apiKey';
    static searchTv(String query) => 'https://api.themoviedb.org/3/search/tv$apiKey&query=$query';

}
