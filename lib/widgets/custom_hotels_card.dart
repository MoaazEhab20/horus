import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/hotel_model.dart';
import '../screens/touristview/profile_pages/hotels_details_screen.dart';

class CustomHotelsCard extends StatelessWidget {
  final Hotel hotel;

  const CustomHotelsCard({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelsDetailsScreen(hotel: hotel),
          ),
        );
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
              child: Container(
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: DecorationImage(
                    image: NetworkImage(hotel.images.isNotEmpty
                        ? hotel.images[0].img
                        : 'assets/images/hotels.webp'), // Use local image if network image is not available
                    fit: BoxFit.fill,
                  ),
                ),
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
                    hotel.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 19,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 17,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Flexible(
                          child: Text(
                            hotel.region,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Show More',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xffF5903F),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
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
                ignoreGestures: true,
                itemSize: 24,
                initialRating: hotel.rating,
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
