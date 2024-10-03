import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../model/Components/Custom_Text.dart';
import '../../../model/models/Movie_Model.dart';
import '../../Details_Movie_Page/ContentPage.dart';
class RandomSection extends StatelessWidget {

 final Movie randomMovie;
  const RandomSection({super.key, required this.randomMovie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: randomMovie.imageUrl,
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
                    text: randomMovie.title,
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(onPressed: (){
                  // Add your logic here
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsPage(movie: randomMovie, )));
                }, child: const Icon(Icons.info_outline, color: Colors.white, size: 20,)),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
