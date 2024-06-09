import 'package:flutter/material.dart';

import 'custom_recommend_card.dart';

class CustomRecommendListView extends StatelessWidget {
  const CustomRecommendListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      child: ListView.builder(
        itemCount: 6,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const CustomRecommendCard();
        },
      ),
    );
  }
}
