import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/controller/Movie/cubit/Movie_Cubit.dart';
import 'package:movies_app/controller/Movie/cubit/Movie_State.dart';
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
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            BlocBuilder<MovieCubit, MovieState>(
              builder: (context, state) {
                return Container(
                  width: double.infinity,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.3,
                  padding: const EdgeInsets.all(10),
                  child: CachedNetworkImage(imageUrl:state.randomMovie.imageUrl,errorWidget:(context, url, error) {
                    return const Icon(Icons.error);
                  },placeholder: (context, url) {
                    return Container(
                          width: double.infinity,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.3,
                          color: Colors.grey,
                        );


                  },fit: BoxFit.cover,
                   imageBuilder: (context, imageProvider) {
                    return Container(
                      width: double.infinity,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                   },),
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
