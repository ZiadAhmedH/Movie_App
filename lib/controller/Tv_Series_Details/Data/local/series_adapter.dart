import 'package:hive/hive.dart';

part 'series_adapter.g.dart';

@HiveType(typeId: 0)
class HiveSeries {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String overview;



  HiveSeries({required this.id, required this.title, required this.overview, });
}
