import 'package:get_it/get_it.dart';
import 'package:movies_app/controller/Repos/Movies_Repo.dart';

import '../controller/Repos/Movies_ThreeD_Repo.dart';


final getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton<MoviesRepo>(() => MoviesRepo());
  getIt.registerLazySingleton<ThreeDMovieRepository>(() => ThreeDMovieRepository());
}
