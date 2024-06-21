import 'package:flutter/material.dart';
import '../models/landmark_model.dart';
import 'custom_recommend_card.dart';

class CustomRecommendListView extends StatelessWidget {
  final List<Landmark> recommendations;

  const CustomRecommendListView({
    required this.recommendations,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      child: ListView.builder(
        itemCount: recommendations.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomRecommendCard(
            landmark: recommendations[index],
          );
        },
      ),
    );
  }
}
