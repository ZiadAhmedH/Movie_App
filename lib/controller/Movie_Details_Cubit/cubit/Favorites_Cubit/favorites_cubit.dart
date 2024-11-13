import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/controller/Movie_Details_Cubit/Data/Models/Movie_Deatails_Model.dart';
import '../../../Movie/Data/Models/Movie_Model.dart';
import '../../Data/Local/movie_adapter.dart';
import '../../Data/Local/movie_dao.dart';
import 'favorites_state.dart';



class FavoritesCubit extends Cubit<FavoritesState> {
  final MovieDao _movieDao = GetIt.instance<MovieDao>();

  FavoritesCubit() : super(const FavoritesState.initial());

  Future<MovieDetails> toggleFavorite(Movie movie) async {
    // Check if the movie is already in favorites
    bool isCurrentlyFav = await _movieDao.isFavorite(movie.id);

    // If the movie is already in favorites, remove it
    if (isCurrentlyFav) {
      await _movieDao.removeFromFavorites(movie.id); // Remove movie from favorites
      emit(FavoritesState.favoriteRemoved(movieId: movie.id)); // Emit removed state
    } else {
      // If the movie is not in favorites, add it
      await _movieDao.addToFavorites(HiveMovie(
        id: movie.id,
        title: movie.title.toString(),
        overview: movie.overview.toString(),
        isFav: true,  // Mark it as a favorite
      ));
      emit(FavoritesState.favoriteAdded(movieId: movie.id)); // Emit added state
    }

    // Update the list of favorites
    final updatedFavorites = await _movieDao.getFavoriteMovies();
    emit(FavoritesState.loaded(favorites: updatedFavorites));

    // Toggle the isFav value and create an updated MovieDetailsModel
    final updatedMovieDetails = MovieDetails(
      id: movie.id,
      title: movie.title,
      overview: movie.overview,
      // Toggle the isFav based on the updated status
      isFav: !isCurrentlyFav,
    );
    emit(FavoritesState.favoriteUpdated(movie: updatedMovieDetails));

    return updatedMovieDetails; // Return the updated MovieDetailsModel
  }


  Future<void> loadFavorites() async {
    emit(const FavoritesState.loading());
    final favorites = await _movieDao.getFavoriteMovies();
    emit(FavoritesState.loaded(favorites: favorites));
  }

  // check using id and then change the isFav or not

 Future<void> checkIsFavOrNot() async{

 }



}