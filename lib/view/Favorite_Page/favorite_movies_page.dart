import 'package:flutter/material.dart';

import '../../Core/Components/Custom_Text.dart';

class FavoriteMoviesPage extends StatelessWidget {
  const FavoriteMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color.fromRGBO(44, 43, 43, 1);

    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          title: const CustomText(
            text: "My List",
            color: Colors.white,
            fontSize: 22,
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: const Color.fromRGBO(60, 60, 60, 1),
                child: const TabBar(

                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(icon: Icon(Icons.movie), text: 'Movies'),
                    Tab(icon: Icon(Icons.tv), text: 'Series'),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: const Color.fromRGBO(50, 50, 50, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const TabBarView(
              children: [
                // Movies Tab Content
                MoviesTab(),
                // Series Tab Content
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Movies Tab Widget
class MoviesTab extends StatelessWidget {
  const MoviesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.movie, size: 100, color: Colors.yellow),
          Text(
            'Your favorite movies will appear here!',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

// Series Tab Widget
class SeriesTab extends StatelessWidget {
  const SeriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.tv, size: 100, color: Colors.yellow),
          Text(
            'Your favorite series will appear here!',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
