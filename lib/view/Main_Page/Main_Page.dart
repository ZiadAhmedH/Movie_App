import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/controller/Movie_Cubit/Movie_State.dart';
import 'package:movies_app/controller/ThreeDCubit/three_dcubit_cubit.dart';
import 'package:movies_app/controller/ThreeDCubit/three_dcubit_state.dart';
import 'package:movies_app/model/Components/Custom_Text.dart';
import 'package:movies_app/model/widgets/Movie_List_Widget.dart';
import 'package:movies_app/view/Main_Page/3d_Movies_Section/ThreeD_Movies_Section.dart';
import 'package:movies_app/view/Main_Page/Movie_Section/movies_list_page.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../controller/Movie_Cubit/Movie_Cubit.dart';
import '../../controller/Movies_Repo.dart';
import '../../model/models/Movie_Model.dart';
import 'Movie_Section/Movie_Section.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {


    var state = context.watch<MovieCubit>().state;

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
