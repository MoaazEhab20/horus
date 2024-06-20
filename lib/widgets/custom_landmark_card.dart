import 'package:flutter/material.dart';

import '../models/landmark_model.dart';
import '../screens/touristview/home_pages/landmark_details.dart';

class CustomLandmarkCard extends StatelessWidget {
  final Landmark landmark;

  const CustomLandmarkCard({
    super.key,
    required this.landmark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => landmarkDetailsScreen(
                      landmark: landmark,
                    )));
      },
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
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(29),
                      topRight: Radius.circular(29),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(landmark.images.isNotEmpty
                          ? landmark.images[0].img
                          : 'assets/images/hotels.webp'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 12),
                  child: Text(
                    landmark.name,
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
          ],
        ),
      ),
    );
  }
}
