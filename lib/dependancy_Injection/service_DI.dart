import 'package:get_it/get_it.dart';

import '../controller/Movie/Data/Repo/Movies_Repo.dart';



final getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton<MovieRepository>(() => MovieRepository());

}
