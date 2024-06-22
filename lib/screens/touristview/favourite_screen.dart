import 'package:final_project/components/custom_text.dart';
import 'package:final_project/models/landmark_model.dart';
import 'package:final_project/services/favorite_services.dart';
import 'package:final_project/widgets/custom_favourite_card.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  late Future<List<Landmark>> _futureFavorites;
  final FavoriteService _favoriteService = FavoriteService();

  @override
  void initState() {
    super.initState();
    _futureFavorites = _favoriteService.fetchFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextForTitleL(data: 'Favourite'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            FutureBuilder<List<Landmark>>(
              future: _futureFavorites,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (snapshot.hasError) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text('Error: ${snapshot.error}')),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(child: Text('No favourites available')),
                  );
                } else {
                  List<Landmark> favorites = snapshot.data!;
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        Landmark favorite = favorites[index];
                        return CustomFavouriteCard(
                          landmark: favorite,
                        );
                      },
                      childCount: favorites.length,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
