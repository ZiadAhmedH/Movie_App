//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:movies_app/controller/Movie_Details_Cubit/cubit/detials_movie_state.dart';
// import 'package:movies_app/model/Components/Custom_Text.dart';
// import '../../controller/Movie_Details_Cubit/cubit/detials_movie_cubit.dart';
// import '../../model/models/Movie_Model.dart';
// import '../Movie_Video_Page/Movie_Video.dart';
//
// class MovieDetailsPage extends StatelessWidget {
//   final Movie movie;
//   const MovieDetailsPage({
//     super.key, required this.movie,});
//
//   @override
//   Widget build(BuildContext context) {
//     var movieDetailsCubit = MoviesDetailsCubit.get(context);
//     return BlocBuilder<MoviesDetailsCubit, MovieDetailsState>(
//   builder: (context, state) {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         CachedNetworkImage(
//           imageUrl: movie.posterPath ?? '' ,
//           fit: BoxFit.cover,
//           errorWidget: (context, url, error) => const Icon(Icons.error),
//           placeholder: (context, url) =>  Center(
//             child: LoadingAnimationWidget.discreteCircle(color: Colors.white10, size: 100),
//           ),
//         ),
//         ListView(
//           padding: MediaQuery.of(context).padding +
//               const EdgeInsets.symmetric(horizontal: 16),
//           children: [
//             Row(
//               children: [
//                 Container(
//                   width: 100,
//                   height: 150,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: Colors.yellow, width: 5),
//                     color: Colors.red,
//                   ),
//                   clipBehavior: Clip.antiAlias,
//                   child: CachedNetworkImage(
//                     imageUrl: movie.posterPath ?? '' ,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       movie.title,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       'Year: ${movie.year} ',
//                       style: const TextStyle(color: Colors.white , fontSize: 18 , fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       'Rating: ${movie.rating}',
//                       style: const TextStyle(color: Colors.white , fontSize: 18 , fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       'Runtime: ${movie.runtime} minutes',
//                       style: const TextStyle(color: Colors.white ,  fontSize: 18 , fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//
//             Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         movieDetailsCubit.toggleFavorite(movie);
//                       },
//                       icon: Icon(
//                         movieDetailsCubit.favoriteList.contains(movie)
//                             ? Icons.favorite
//                             : Icons.favorite_border,
//                         color: movieDetailsCubit.favoriteList.contains(movie) ? Colors.red : null,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     // add button to bavigate to the movie trailer
//                     TextButton(
//                       onPressed: () {
//                         // Navigate to the movie trailer
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => YouTubeVideoPlayer(videoName: movie.title)));
//                       },
//                       child:  FaIcon(FontAwesomeIcons.youtube , color: Colors.red, size: 30,),
//                     ),
//                   ],
//                 ),
//                 FaIcon(FontAwesomeIcons.shareFromSquare , size: 30,)
//               ],
//             ),
//
//
//             const SizedBox(height: 10),
//
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: Colors.yellow.withOpacity(1),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child:CustomText(text:"Genres" , fontWeight: FontWeight.bold,) ),
//                 Flexible(
//                   child: Container(
//                     padding: const EdgeInsets.all(8),
//                     child: movie.genres.isNotEmpty ? CustomText(text:
//                     '${movie.genres.join(', ')}',
//                       fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                       fontSize: 16,
//                     ) : const CustomText(text: 'No genres found' , color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),
//                   ),
//                 ),
//               ],
//             ),
//
//
//           ],
//         ),
//       ],
//     );
//   },
// );
//   }
// }