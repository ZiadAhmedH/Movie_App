import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/controller/Tv_Series/Data/Repo/Series_Repo.dart';

import '../Data/Models/Series_Model.dart';

part 'series_state.dart';

class SeriesCubit extends Cubit<SeriesState> {

  final SeriesRepository seriesRepo =  GetIt.instance<SeriesRepository>();

  SeriesCubit() : super(SeriesInitial());


  Future<void> fetchTrendingSeries() async {
    emit(SeriesLoading());
    try {
      final seriesList = await seriesRepo.fetchSeries();
      print(seriesList.toString());
      emit(SeriesLoaded(seriesList!));
    } catch (e) {
      emit(SeriesError(e.toString()));
    }
  }
}
