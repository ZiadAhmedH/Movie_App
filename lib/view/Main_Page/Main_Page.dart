import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies_app/controller/Movie/cubit/Movie_Cubit.dart';
import 'package:movies_app/controller/Movie/cubit/Movie_State.dart';
import 'package:movies_app/model/Components/Custom_Text.dart';
import 'package:movies_app/view/Main_Page/3d_Movies_Section/ThreeD_Movies_Section.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'Movie_Section/Movie_Section.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 43, 43, 1),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.fast,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<MovieCubit, MovieState>(
              bloc: MovieCubit()..fetchRandomMovie(),
              builder: (context, state) {
                return Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: state.randomMovie.imageUrl,
                      scale: 1.0,
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      errorWidget: (context, url, error) {
                        return Center(
                            child: LoadingAnimationWidget.discreteCircle(
                                color: Colors.white10, size: 30));
                      },
                      imageBuilder: (context, imageProvider) => Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3 , // Adjust height based on your need
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit
                                .cover, // This will stretch the image to fill the container
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.black.withOpacity(0.2),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Flexible(
                              child: CustomText(
                                text: state.randomMovie.title,
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(onPressed: (){}, child: const Icon(Icons.info_outline, color: Colors.white, size: 20,)),

                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            MovieSection(),

            ThreeDMoviesSection(),

            // add some Container widgets here

            Container(
              height: 100,
              color: Colors.red,
            ),
            Container(
              height: 100,
              color: Colors.blue,
            ),
            Container(
              height: 100,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
