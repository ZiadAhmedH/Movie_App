import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/view/Main_Page/3d_Movies_Section/ThreeD_Movies_Section.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'Movie_Section/Movie_Section.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 43, 43, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          MovieSection(),


          ThreeDMoviesSection()


        ],
      ),
    );
  }
}
