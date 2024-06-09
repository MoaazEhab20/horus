import 'package:final_project/components/custom_text.dart';
import 'package:final_project/widgets/custom_favourite_card.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextForTitleL(data: 'Favourite'),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [CustomFavouriteCard()],
            ),
          )
        ],
      ),
    );
  }
}
