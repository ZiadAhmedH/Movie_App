import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/controller/Tv_Series/Cubit/series_cubit.dart';
import 'package:movies_app/controller/Tv_Series/presentation/Series_Section/All_Series_GridView.dart';
import 'package:movies_app/controller/Tv_Series/presentation/widgets/Series_Widget.dart';
import '../../../../Core/Components/Custom_Text.dart';
import '../../Cubit/series_state.dart';

class SeriesSection extends StatelessWidget {
  const SeriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomText(
              text: 'TV Shows Trending Today',
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            InkWell(
              onTap: () {
                // Use BlocProvider.value to pass the existing cubit
                final seriesCubit = context.read<SeriesCubit>();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: seriesCubit,
                      child: ViewAllSeries(),
                    ),
                  ),
                );
              },
              child: const CustomText(
                text: 'View All',
                fontSize: 14,
                color: Colors.deepOrangeAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        BlocBuilder<SeriesCubit, SeriesState>(
          builder: (context, state) {
            if (state is SeriesLoaded) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.seriesList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return SeriesWidget(series: state.seriesList[index]);
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
    );
  }
}
