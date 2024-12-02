import 'package:hive/hive.dart';

 part 'movie_adapter.g.dart';

 @HiveType(typeId: 0)
 class HiveMovie {
   @HiveField(0)
   final int id;

    @HiveField(1)
    final String title;

   @HiveField(2)
   final String overview;



   HiveMovie({required this.id, required this.title, required this.overview, });
 }
