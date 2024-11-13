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

   @HiveField(3)
   bool _isFav; // Make `_isFav` private and add a method to modify it

   bool get isFav => _isFav; // Getter for isFav

   void setFavoriteStatus(bool status) {
     _isFav = status;
   }

   HiveMovie({required this.id, required this.title, required this.overview, bool isFav = false}) : _isFav = isFav;
 }
