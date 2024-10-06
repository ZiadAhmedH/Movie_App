import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/cupertino.dart';

import '../Movie/Data/Models/Movie_Model.dart';

abstract class BaseMoviesRepo {



  Future<IList<Movie>> fetchMovies({required int page});


}