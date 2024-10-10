import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/controller/Tv_Series/Cubit/series_cubit.dart';
import 'package:movies_app/controller/Tv_Series/presentation/widgets/Series_Widget.dart';

import '../../../../model/Components/Custom_Text.dart';
class SeriesSection extends StatelessWidget {
  const SeriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => SeriesCubit()..fetchTrendingSeries(),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomText(
              text: 'TV Shows Trending Today',
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {

              },
              child: CustomText(
                text: 'View All',
                fontSize: 14,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),

          // Movie List Section
          BlocBuilder<SeriesCubit, SeriesState>(
            builder: (context, state) {
              if (state is SeriesLoaded) {

                print("${state.seriesList.length} series found in the list of series");
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state
                              .seriesList.length, // Ensure movies list isn't null
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            // Make sure the MovieWidget has access to the cubit
                            return SeriesWidget(
                               series: state.seriesList[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
