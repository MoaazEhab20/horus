import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

import '../../../models/hotel_model.dart';

class HotelsDetailsScreen extends StatelessWidget {
  final Hotel hotel;

  const HotelsDetailsScreen({Key? key, required this.hotel}) : super(key: key);

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: size.height * 0.37,
                child: Carousel(size: size, hotel: hotel),
              ),
              SizedBox(height: 4),
              DefaultText(
                txt: hotel.name,
                size: 30,
                fontWeight: FontWeight.w600,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  children: [
                    RatingBar(
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
                    Spacer(),
                    DefaultText(
                      txt: hotel.rating.toString(),
                      size: 18,
                    )
                  ],
                ),
              ),
              DefaultText(
                txt: hotel.description,
                size: 14,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 20),
                child: DefaultText(
                  txt: 'Location in Maps',
                  size: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                onTap: () {
                  launchURL(hotel.location);
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: Image.asset('assets/images/map.jpg')),
              ),
              SizedBox(height: 21),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  children: [
                    DefaultText(
                      txt: 'Booking',
                      size: 30,
                    ),
                    Spacer(),
                    Text(
                      'Choose One of Them',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        color: Color(0xffF5903F),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(hotel.bookings.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: InkWell(
                          onTap: () {
                            launchURL(hotel.bookings[index].bookingLink);
                          },
                          borderRadius: BorderRadius.circular(29),
                          child: Image.network(
                            hotel.bookings[index].bookingImage,
                            height: 125,
                            width: 125,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Carousel extends StatelessWidget {
  final Hotel hotel;
  final Size size;

  const Carousel({Key? key, required this.size, required this.hotel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> imageWidgets = hotel.images.map((image) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: Stack(
          children: [
            Image.network(
              image.img,
              height: size.height,
              width: size.width,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: size.height * 0.01,
              child: IconButton(
                iconSize: 30,
                icon: Container(
                    width: 40,
                    height: 37,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Color(0xffF5903F),
                      ),
                    )),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            // Positioned(
            //   top: size.height * 0.01,
            //   left: size.width * 0.8,
            //   child: Container(
            //     width: 40,
            //     height: 37,
            //     decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: Colors.white,
            //     ),
            //     child: IconButton(
            //       icon: Icon(Icons.favorite_border),
            //       color: Color(0xffF5903F),
            //       onPressed: () {},
            //     ),
            //   ),
            // )
          ],
        ),
      );
    }).toList();

    return AnotherCarousel(
      images: imageWidgets,
      dotBgColor: Colors.transparent,
      dotIncreasedColor: Color(0xffF5903F),
      dotIncreaseSize: 1.2,
      dotSpacing: 15,
      dotSize: 8,
      autoplay: true,
      indicatorBgPadding: 7.0,
    );
  }
}

// ignore: must_be_immutable
class DefaultText extends StatelessWidget {
  final String? txt;
  final double? size;
  final FontWeight? fontWeight;

  const DefaultText({
    Key? key,
    required this.txt,
    required this.size,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt!,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: size!,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }
}
