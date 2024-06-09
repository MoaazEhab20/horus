import 'package:flutter/material.dart';

import '../models/categories_model.dart';
import 'custom_categories_card.dart';

class CustomCategoriesListView extends StatelessWidget {
  const CustomCategoriesListView({
    super.key,
  });

  final List<CategoriesModel> categories = const [
    CategoriesModel(
        image: 'assets/images/pyramids.png',
        categorieType: 'Landmarks',
        navigat: 'LandmarkScreen'),
    CategoriesModel(
        image: 'assets/images/hotel.png',
        categorieType: 'Hotels',
        navigat: 'HotelScreen'),
    CategoriesModel(
        image: 'assets/images/tour-guide.png',
        categorieType: 'Tour Guide',
        navigat: 'TourguideScreen'),
    CategoriesModel(
        image: 'assets/images/bus.png',
        categorieType: 'Transportation ',
        navigat: 'TransportScreen'),
    CategoriesModel(
        image: 'assets/images/theater.png',
        categorieType: 'Entertainment',
        navigat: 'EntertainmentScreen'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CustomCategoriesCard(
            categories: categories[index],
          );
        },
      ),
    );
  }
}
