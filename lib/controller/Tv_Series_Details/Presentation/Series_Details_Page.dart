import 'package:flutter/services.dart';
import 'package:movies_app/controller/Tv_Series/Data/Models/Series_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Movies/Movie_Details_Cubit/Presentation/ShimmerDetailsMovie.dart';
import '../Cubit/series_detials_state.dart';
import 'package:movies_app/controller/Tv_Series_Details/Cubit/series_detials_cubit.dart';

import 'Series_Details_Content.dart';

class SeriesDetailsScreen extends StatelessWidget {
  final Series series;
  const SeriesDetailsScreen({super.key, required this.series});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesDetailsCubit, SeriesDetailsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(44, 43, 43, 1),
          extendBodyBehindAppBar: true,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent, // Make status bar transparent
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Shimmer loader when the state is loading
                  state is DetailsSeriesStateLoading
                      ? buildShimmerLoader(context)
                      : buildSeriesDetails(context, state,
                          () {
                        context.read<SeriesDetailsCubit>().toggleFavorite(series);
                      },)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
