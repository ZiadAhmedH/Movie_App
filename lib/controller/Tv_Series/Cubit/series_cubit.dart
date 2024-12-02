import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/controller/Tv_Series/Cubit/series_state.dart';
import 'package:movies_app/controller/Tv_Series/Data/Repo/Series_Repo.dart';

import '../../Tv_Series_Details/Data/local/Hive_Series_Database.dart';
import '../../Tv_Series_Details/Data/local/series_adapter.dart';
import '../Data/Models/Series_Model.dart';


class SeriesCubit extends Cubit<SeriesState> {

  final SeriesRepository _seriesRepository =  GetIt.instance<SeriesRepository>();
  int currentPage = 1;
  bool hasMoreSeries = true;
  bool isLoading = false;


  SeriesCubit() : super(SeriesInitial());


  Future<void> fetchTrendingSeries() async {
    emit(SeriesLoading());
    try {
      final seriesList = await _seriesRepository.fetchSeries();
      print(seriesList.toString());
      emit(SeriesLoaded(
        seriesList: seriesList!,
        hasMoreSeries: hasMoreSeries,
      ));
    } catch (e) {
      emit(SeriesError(e.toString()));
    }
  }
  Future<void> fetchMorePopularSeries() async {
    if (isLoading || !hasMoreSeries) return; // Prevent concurrent requests or unnecessary calls

    isLoading = true;

    try {
      // Fetch the next page of popular series
      final newSeries = await _seriesRepository.fetchSeriesPagination(currentPage);

      if (newSeries.isNotEmpty) {
        currentPage++;
        // Continue as long as data is returned
        hasMoreSeries = newSeries.length == 20;

        // Access favorites box once
        final favoritesBox = await HiveSeriesDatabase.openBox<HiveSeries>('favoritesSeriesBox');
        final favoriteIds = favoritesBox.keys.cast<int>().toSet();

        // Update series with favorite status
        final updatedSeries = newSeries.map((series) =>
            series.copyWith(isFav: favoriteIds.contains(series.id))
        ).toList();

        if (state is SeriesLoaded) {
          final currentState = state as SeriesLoaded;
          emit(SeriesLoaded(
            seriesList: List.of(currentState.seriesList)..addAll(updatedSeries),
            hasMoreSeries: hasMoreSeries,
          ));
        } else {
          emit(SeriesLoaded(
            seriesList: updatedSeries,
            hasMoreSeries: hasMoreSeries,
          ));
        }
      } else {
        print(
            'Loaded ${newSeries.length} more series. Current page: $currentPage');

        // Stop pagination if no more data
        hasMoreSeries = false;
      }
    } catch (e) {
      print('Error loading more series: $e');
      emit(SeriesError(e.toString()));
    } finally {
      isLoading = false; // Always reset loading state
    }
  }



}
