import 'package:flutter/material.dart';
import '../models/landmark_model.dart';
import '../screens/touristview/home_pages/entertiment_details.dart';

class CustomEntertimentCard extends StatelessWidget {
  final Landmark entertiment;

  const CustomEntertimentCard({
    super.key,
    required this.entertiment,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => entertimentDetailsScreen(
                      entertiment: entertiment,
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
                      image: NetworkImage(entertiment.images.isNotEmpty
                          ? entertiment.images[0].img
                          : 'assets/images/hotels.webp'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 12),
                  child: Text(
                    entertiment.name,
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
