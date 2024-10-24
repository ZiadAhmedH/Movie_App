import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/controller/Tv_Series/Cubit/series_cubit.dart';
import 'package:movies_app/controller/Tv_Series_Details/Cubit/series_detials_state.dart';

import '../Data/Models/Series_Details_Model.dart';
import '../Data/Repo/Series_Details_Repo.dart';


class SeriesDetialsCubit extends Cubit<SeriesDetailsState> {

  final SeriesDetailsRepository _seriesDetailsRepo = GetIt.instance<SeriesDetailsRepository>();

  SeriesDetialsCubit() : super(DetailsSeriesStateInitial());

  void getSeriesDetails(int seriesId) async {
    emit(DetailsSeriesStateLoading());
    try {
       final seriesDetails = await _seriesDetailsRepo.getSeriesDetails(seriesId);
       emit(DetailsSeriesStateLoaded(seriesDetails: seriesDetails));
    } catch (e) {
      emit(DetailsSeriesStateError(error: e.toString()));
    }
  }

}
