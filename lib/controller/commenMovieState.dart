import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:movies_app/model/models/Movie_test.dart';

import '../model/models/Movie_Model.dart';

abstract class MovieStateInterface {
  IList<Movie> get movies;
  bool get hasMoreMovies;
  bool get isLoading;
}