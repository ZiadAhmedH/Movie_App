import 'package:hive/hive.dart';

 part 'movie_adapter.g.dart';

 @HiveType(typeId: 0)
 class Movie {
   @HiveField(0)
   final int id;

   @HiveField(1)
   final String title;

   @HiveField(2)
   final String genre;

   Movie({required this.id, required this.title, required this.genre});
 }
