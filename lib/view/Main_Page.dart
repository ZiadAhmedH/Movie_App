import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/controller/Movie_Cubit/Movie_State.dart';
import 'package:movies_app/model/Components/Custom_Text.dart';
import 'package:movies_app/model/widgets/Movie_List_Widget.dart';

import '../controller/Movie_Cubit/Movie_Cubit.dart';
import '../controller/Movies_Repo.dart';
import '../model/widgets/Movie_Widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 43, 43, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          BlocProvider(
          create: (context) => MovieCubit(context.read<MoviesRepo>())..fetchMovies(),
              child:  BlocBuilder<MovieCubit, MovieState>(
            builder: (context, state) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 8,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return MovieWidget(movie: state.movies[index]);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          ),


          const SizedBox(height: 20),

          BlocProvider(
            create: (context) => MovieCubit(context.read<MoviesRepo>())..fetchSample3DMovies(),
            child:  BlocBuilder<MovieCubit, MovieState>(
              builder: (context, state) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 8,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Movie3DWidget(movie: state.movies[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
