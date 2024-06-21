import 'package:final_project/screens/touristview/home_pages/landmark_details.dart';
import 'package:flutter/material.dart';
import '../models/landmark_model.dart';
import '../screens/touristview/details_screen.dart';

class CustomRecommendCard extends StatelessWidget {
  final Landmark landmark;

  const CustomRecommendCard({
    required this.landmark,
    super.key,
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
        padding: const EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            Container(
              width: 160,
              height: 225,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                image: DecorationImage(
                  image: NetworkImage(landmark.images.isNotEmpty
                      ? landmark.images[0].img
                      : 'assets/images/placeholder.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(25)),
              ),
            ),
            Positioned(
              top: 165,
              child: Container(
                width: 160,
                height: 60,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(221, 245, 145, 63),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8, top: 4),
                      child: Text(
                        landmark.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8, right: 4, top: 4),
                          child: Icon(
                            Icons.location_on_sharp,
                            color: Theme.of(context).primaryColorLight,
                            size: 20,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${landmark.region}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontSize: 16,
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
            ),
          ],
        ),
      ),
    );
  }
}
