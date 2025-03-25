import 'package:flutter/material.dart';
import 'package:movies_app/Core/Components/Custom_Text.dart';
class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title:  const CustomText(text: 'My List' , fontSize: 20, fontWeight: FontWeight.bold,),
    ),
    body: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title:  const CustomText(text: 'Movie Name', fontSize: 16, fontWeight: FontWeight.bold,),
          subtitle:  const CustomText(text: 'Movie Description', fontSize: 14, fontWeight: FontWeight.normal,),
          leading: const Icon(Icons.movie),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {},
          ),
        );
      },
    ),
    );
  }
}
