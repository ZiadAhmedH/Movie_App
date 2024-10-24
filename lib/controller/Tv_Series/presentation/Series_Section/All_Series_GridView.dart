import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../Cubit/series_cubit.dart';
import '../../Cubit/series_state.dart';
import '../widgets/Series_Widget.dart';

class ViewAllSeries extends StatefulWidget {
  @override
  _ViewAllSeriesState createState() => _ViewAllSeriesState();
}

class _ViewAllSeriesState extends State<ViewAllSeries> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
        context.read<SeriesCubit>().fetchMorePopularSeries();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = context.watch<SeriesCubit>().state;

    if (state is SeriesLoading) {
      return Center(
        child: LoadingAnimationWidget.dotsTriangle(color: Colors.orangeAccent, size: 50),
      );
    } else if (state is SeriesError) {
      return Center(child: Text('Error: ${state.error}'));
    } else if (state is SeriesLoaded) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(44, 43, 43, 1),
        body: GridView.builder(
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.7,
          ),
          itemCount: state.seriesList.length + (state.hasMoreSeries ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == state.seriesList.length && state.hasMoreSeries) {
              return Center(
                child: LoadingAnimationWidget.discreteCircle(color: Colors.white10, size: 20),
              );
            }
            final series = state.seriesList[index];
            return SeriesWidget(series: series);
          },
        ),
      );
    }
    return const Center(child: Text('No series available'));
  }
}
