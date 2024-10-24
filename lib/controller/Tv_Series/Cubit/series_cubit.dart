import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/controller/Tv_Series/Cubit/series_state.dart';
import 'package:movies_app/controller/Tv_Series/Data/Repo/Series_Repo.dart';

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
    if (!isLoading && hasMoreSeries) {
      isLoading = true;
      try {
        final newSeries = await _seriesRepository.fetchSeriesPagination(currentPage);
        if (newSeries.isNotEmpty) {
          currentPage++;
          hasMoreSeries = newSeries.length == 20; // Check if more series are available

          final currentState = state as SeriesLoaded;
          emit(SeriesLoaded(
            seriesList: List.of(currentState.seriesList)..addAll(newSeries),
            hasMoreSeries: hasMoreSeries,
          ));
          print('Loaded ${newSeries.length} more series. Current page: $currentPage'); // Debugging print
        } else {
          hasMoreSeries = false; // No more series to load
          print('No more series available on page $currentPage'); // Debugging print
        }
      } catch (e) {
        print('Error loading more series: $e'); // Debugging print
        emit(SeriesError(e.toString()));
      } finally {
        isLoading = false; // Reset loading state
      }
    }
  }


}
