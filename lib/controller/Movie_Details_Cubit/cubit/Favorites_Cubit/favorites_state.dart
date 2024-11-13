import 'package:freezed_annotation/freezed_annotation.dart';
import '../../Data/Local/movie_adapter.dart';
import '../../Data/Models/Movie_Deatails_Model.dart';

part 'favorites_state.freezed.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.initial() = FavoritesInitial;
  const factory FavoritesState.loading() = FavoritesLoading;
  const factory FavoritesState.loaded({required List<HiveMovie> favorites}) = FavoritesLoaded;

  const factory FavoritesState.favoriteAdded({required int movieId}) = FavoriteAdded;
  const factory FavoritesState.favoriteRemoved({required int movieId}) = FavoriteRemoved;
  const factory FavoritesState.favoriteUpdated({required MovieDetails movie}) = FavoriteUpdated;

}
