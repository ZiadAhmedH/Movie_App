class ApiConstant {
  static const String baseUrl = 'api.themoviedb.org';
  static const String imageUrl = 'https://image.tmdb.org/t/p/w500/';
  static const String nowPlayingApi = '${baseUrl}${apiName}now_playing${apiKey}';
  static const String topRatedApi = '${baseUrl}${apiName}top_rated${apiKey}';
  static const String upcomingApi = '${baseUrl}${apiName}upcoming${apiKey}';
  static const String popularApi = "${baseUrl}${apiName}popular${apiKey}";
  static const String apiName = '/3/movie/';
  static const String similar = '/similar';
  static const String video = '/videos';
  static const String apiKey = 'api_key=bc7fc4bfb4720e0547a7facf1b65ba21';
  static String baseImageUrl='https://image.tmdb.org/t/p/original';

}