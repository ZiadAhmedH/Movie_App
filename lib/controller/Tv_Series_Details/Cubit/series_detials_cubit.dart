import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/controller/Tv_Series/Data/Models/Series_Model.dart';
import 'package:movies_app/controller/Tv_Series_Details/Cubit/series_detials_state.dart';
import 'package:movies_app/controller/Tv_Series_Details/Data/Repo/Series_Details_Repo.dart';
import 'package:movies_app/controller/Tv_Series_Details/Data/local/series_dao.dart';

import '../Data/local/series_adapter.dart';

class SeriesDetailsCubit extends Cubit<SeriesDetailsState> {
  final SeriesDetailsRepository _seriesDetailsRepo = GetIt.instance<SeriesDetailsRepository>();
  final SeriesDao _seriesDao = GetIt.instance<SeriesDao>();

  SeriesDetailsCubit() : super(DetailsSeriesStateInitial());

  Future<void> getSeriesDetails(int seriesId) async {
    emit(DetailsSeriesStateLoading());
    try {
      final seriesDetails = await _seriesDetailsRepo.getSeriesDetails(seriesId);
      emit(DetailsSeriesStateLoaded(
        seriesDetails: seriesDetails,
        isFav: await _seriesDao.isFavorite(seriesId),
      ));
    } catch (e) {
      emit(DetailsSeriesStateError(error: e.toString()));
    }
  }

  Future<void> toggleFavorite(Series series) async {
    try {
      final isCurrentlyFavorite = await _seriesDao.isFavorite(series.id);
      if (isCurrentlyFavorite) {
        // Remove series from favorites
        await _seriesDao.removeFromFavorites(series.id);
        emit(
          DetailsSeriesStateLoaded(
            seriesDetails: (state as DetailsSeriesStateLoaded)
                .seriesDetails
                .copyWith(isFav: false),
            isFav: false,
          ),
        );
      } else {
        // Add series to favorites
        await _seriesDao.addToFavorites(HiveSeries(
          id: series.id,
          title: series.name.toString(),
          overview: series.overview.toString(),
        ));
        emit(
          DetailsSeriesStateLoaded(
            seriesDetails: (state as DetailsSeriesStateLoaded)
                .seriesDetails
                .copyWith(isFav: true),
            isFav: true,
          ),
        );
      }
    } catch (e) {
      emit(DetailsSeriesStateError(error: e.toString()));
    }
  }

  Future<bool> isFavorite(int seriesId) async {
    return await _seriesDao.isFavorite(seriesId);
  }
}
