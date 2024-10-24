import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../model/Components/Custom_Text.dart';
import '../../../view/Movie_Video_Page/Movie_Video.dart';
import '../../Constant/ApiEndPoints.dart';
import '../../Movie_Details_Cubit/Presentation/ShimmerDetailsMovie.dart';
import '../Cubit/series_detials_state.dart';
import 'package:movies_app/controller/Tv_Series_Details/Cubit/series_detials_cubit.dart';

import 'Series_Details_Content.dart';

class SeriesDetailsScreen extends StatelessWidget {
  final int seriesId;
  const SeriesDetailsScreen({super.key, required this.seriesId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesDetialsCubit, SeriesDetailsState>(
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
                      : buildSeriesDetails(context, state),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
