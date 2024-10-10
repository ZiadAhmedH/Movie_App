import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../Data/Models/Series_Details_Model.dart';
import '../Data/Repo/Series_Details_Repo.dart';

part 'series_detials_state.dart';

class SeriesDetialsCubit extends Cubit<SeriesDetialsState> {

  final SeriesDetailsRepository _seriesDetailsRepo = GetIt.instance<SeriesDetailsRepository>();

  SeriesDetialsCubit() : super(SeriesDetialsInitial());

  void getSeriesDetails(int seriesId) async {
    emit(SeriesDetialsLoading());
    try {
       final seriesDetails = await _seriesDetailsRepo.getSeriesDetails(seriesId);
       emit(SeriesDetialsLoaded(seriesDetails: seriesDetails));
    } catch (e) {
      emit(SeriesDetialsError(error: e.toString()));
    }
  }
}
