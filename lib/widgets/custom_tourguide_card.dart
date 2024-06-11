import 'package:final_project/screens/touristview/booking_pages/details_tourguide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomTourguideCard extends StatelessWidget {
  const CustomTourguideCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => const detailsTourguide()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 175,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Theme.of(context).primaryColorLight,
              ),
            ),
            Positioned(
              top: 10,
              bottom: 10,
              left: 10,
              //right: 60,
              child: Container(
                width: 160,
                //height: 175,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: const DecorationImage(
                      image: AssetImage(
                          'assets/images/Dave-Dickinson-Headshot.jpg'),
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            Positioned(
              left: 180,
              top: 14,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Moaaz Ehab',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 22,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Text(
                      'English , Arabic',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    '35\$',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Color(0xffF5903F),
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: RatingBar(
                itemSize: 24,
                initialRating: 3.5,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star_rounded,
                    color: Color(0xffF5903F),
                  ),
                  half: const Icon(
                    Icons.star_half_rounded,
                    color: Color(0xffF5903F),
                  ),
                  empty: const Icon(
                    Icons.star_border_rounded,
                    color: Colors.grey,
                  ),
                ),
                onRatingUpdate: (rating) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
