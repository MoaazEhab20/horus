import 'package:final_project/cubit/favorite/favorite_cubit.dart';
import 'package:final_project/cubit/favorite/favorite_state.dart';
import 'package:final_project/models/landmark_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFavouriteCard extends StatefulWidget {
  final Landmark landmark;

  const CustomFavouriteCard({
    super.key,
    required this.landmark,
  });

  @override
  State<CustomFavouriteCard> createState() => _CustomFavouriteCardState();
}

class _CustomFavouriteCardState extends State<CustomFavouriteCard> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(),
      child: BlocConsumer<FavoriteCubit, FavoritesStates>(
        listener: (context, state) {
          if (state is RemoveFavoritesSuccessStates) {
            // Optionally, handle successful removal of the favorite
            setState(() {
              ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Successed of remove favorite')),
            );
            });
          }
          if (state is RemoveFavoritesErrorStates) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to remove favorite')),
            );
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 230,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(29),
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 175,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(29),
                            topRight: Radius.circular(29),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(widget.landmark.images[0].img),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16, top: 12),
                        child: Text(
                          widget.landmark.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    right: 13,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_outlined,
                        color: Color(0xffF5903F),
                        size: 40,
                        shadows: [
                          Shadow(
                            color: Color.fromARGB(25, 0, 0, 0),
                            offset: Offset(0, 4),
                            blurRadius: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 8,
                    child: IconButton(
                      onPressed: () {
                        FavoriteCubit.get(context).removeFavorites(id: '${widget.landmark.id}',);
                      },
                      icon: Icon(
                        Icons.cancel_rounded,
                        color: Theme.of(context).primaryColorLight,
                        size: 35,
                        shadows: [
                          Shadow(
                            color: Color.fromARGB(25, 0, 0, 0),
                            offset: Offset(0, 4),
                            blurRadius: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (state is RemoveFavoritesLoadingStates)
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
