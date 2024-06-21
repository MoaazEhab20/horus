import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:final_project/models/landmark_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class landmarkDetailsScreen extends StatelessWidget {
  final Landmark landmark;
  const landmarkDetailsScreen({super.key, required this.landmark});

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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.37,
              child: Carousel(
                size: size,
                landmark: landmark,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            DefaultText(
              txt: landmark.name,
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
                    initialRating: landmark.rating,
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
                    txt: landmark.rating.toString(),
                    size: 18,
                  )
                ],
              ),
            ),
            DefaultText(
              txt: landmark.description,
              size: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: DefaultText(
                txt: 'Opening Hours',
                size: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            OpeningDays(
              txt: 'Sunday',
              openingH: landmark.sundayOpen,
              clousingH: landmark.sundayClose,
            ),
            OpeningDays(
              txt: 'Monday',
              openingH: landmark.mondayOpen,
              clousingH: landmark.mondayClose,
            ),
            OpeningDays(
              txt: 'Tuesday',
              openingH: landmark.tuesdayOpen,
              clousingH: landmark.tuesdayClose,
            ),
            OpeningDays(
              txt: 'Wednesday',
              openingH: landmark.wednesdayOpen,
              clousingH: landmark.wednesdayClose,
            ),
            OpeningDays(
              txt: 'Thursday',
              openingH: landmark.thursdayOpen,
              clousingH: landmark.thursdayClose,
            ),
            OpeningDays(
              txt: 'Friday',
              openingH: landmark.fridayOpen,
              clousingH: landmark.fridayClose,
            ),
            OpeningDays(
              txt: 'Saturday',
              openingH: landmark.saturdayOpen,
              clousingH: landmark.saturdayClose,
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
                launchURL(landmark.location);
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: Image.asset('assets/images/map.jpg')),
            ),
            SizedBox(
              height: 21,
            ),
            DefaultText(
              txt: 'Ticket Prices',
              size: 30,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 9,
            ),
            TicketPrice(
              txt: 'Egyptian Student : ',
              price: landmark.egyptianStudentTicket,
            ),
            TicketPrice(
              txt: 'Foreigner               : ',
              price: landmark.foreignTicket,
            ),
            TicketPrice(
              txt: 'Foreign Student    : ',
              price: landmark.foreignStudentTicket,
            ),
            TicketPrice(
              txt: 'Egyptian                 : ',
              price: landmark.egyptianTicket,
            ),
            SizedBox(
              height: 26,
            ),
            //The following widget for button
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xffF5903F),
                ),
                width: size.width * 0.89,
                height: size.height * 0.066,
                child: TextButton(
                    onPressed: () {
                      launchURL(
                          landmark.booking ?? 'https://egymonuments.com/');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          widthFactor: 2.8,
                          child: Text(
                            'Get Ticket',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                        Icon(
                          Icons.airplane_ticket,
                          color: Colors.white,
                        )
                      ],
                    )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class Carousel extends StatelessWidget {
  final Landmark landmark;
  final Size size;

  const Carousel({Key? key, required this.size, required this.landmark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> imageWidgets = landmark.images.map((image) {
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
              child: Container(
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
            ),
            Positioned(
              top: size.height * 0.01,
              left: size.width * 0.8,
              child: Container(
                width: 40,
                height: 37,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColorLight,
                ),
                child: FavoriteIconButton(),
              ),
            )
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

class FavoriteIconButton extends StatefulWidget {
  @override
  _FavoriteIconButtonState createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  bool isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
      ),
      color: Color(0xffF5903F),
      onPressed: _toggleFavorite,
    );
  }
}

// ignore: must_be_immutable
class TicketPrice extends StatelessWidget {
  TicketPrice({
    required this.txt,
    required this.price,
    super.key,
  });
  String? txt;
  double? price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DefaultText(txt: txt!, size: 20),
        Spacer(),
        Text('${price!} EGP',
            textWidthBasis: TextWidthBasis.values.first,
            style: TextStyle(fontSize: 20, color: Color(0xffF5903F))),
        // DefaultText(txt: '/ TICKET ', size: 20),
      ],
    );
  }
}

// ignore: must_be_immutable
class OpeningDays extends StatelessWidget {
  OpeningDays({
    required this.txt,
    required this.openingH,
    required this.clousingH,
    super.key,
  });
  String? txt;
  String? openingH;
  String? clousingH;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DefaultText(
          txt: txt!,
          size: 20,
        ),
        Spacer(),
        DefaultText(
            txt:
                '( ${openingH!.substring(0, 5)}AM - ${clousingH!.substring(0, 5)}PM )',
            size: 20)
      ],
    );
  }
}

// ignore: must_be_immutable
class DefaultText extends StatelessWidget {
  DefaultText({
    required this.txt,
    required this.size,
    this.fontWeight,
    super.key,
  });
  double? size;
  FontWeight? fontWeight = FontWeight.w500;
  String? txt;
  @override
  Widget build(BuildContext context) {
    return Text(
      txt!,
      style: TextStyle(
          fontFamily: 'Inter', fontSize: size!, fontWeight: fontWeight),
    );
  }
}
