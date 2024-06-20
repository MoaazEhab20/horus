import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class detailsScreen extends StatelessWidget {
  const detailsScreen({super.key});

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
            Container(
              width: double.infinity,
              height: size.height * 0.37,
              child: Carousel(size: size),
            ),
            SizedBox(
              height: 4,
            ),
            DefaultText(
              txt: 'Giza Pyramids',
              size: 30,
              fontWeight: FontWeight.w600,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  RatingBar(
                    itemSize: 24,
                    initialRating: 4,
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
                    txt: '4.0',
                    size: 18,
                  )
                ],
              ),
            ),
            DefaultText(
              txt:
                  'The Cairo Tower, located on Gezira Island in the Nile River, is a prominent landmark in Cairo, Egypt, standing at a height of 187 meters. Constructed between 1956 and 1961 with assistance from the USSR, the tower features a distinctive lotus-shaped design that reflects elements of ancient Egyptian architecture. Serving as an iconic symbol of the city, the tower provides panoramic views of Cairo from its observation deck, attracting both locals and tourists. Illuminated with vibrant colors at night, the Cairo Tower contributes to the city\'s unique skyline and remains a popular destination for those seeking breathtaking views of the Nile River and the surrounding areas.',
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
            OpeningDays(txt: 'Sunday'),
            OpeningDays(txt: 'Monday'),
            OpeningDays(txt: 'Tuesday'),
            OpeningDays(txt: 'Wednesday'),
            OpeningDays(txt: 'Thursday'),
            OpeningDays(txt: 'Friday'),
            OpeningDays(txt: 'Saturday'),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 20),
              child: DefaultText(
                txt: 'Location in Maps',
                size: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: Image.asset('assets/images/map.jpg')),
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
              price: '5    ',
            ),
            TicketPrice(
              txt: 'Foreigner              : ',
              price: '140',
            ),
            TicketPrice(
              txt: 'Foreign Student   : ',
              price: '70  ',
            ),
            TicketPrice(
              txt: 'Egyptian               : ',
              price: '20  ',
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
                    onPressed: () {},
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
  const Carousel({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnotherCarousel(
      images: [
        ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: Stack(
              children: [
                Stack(
                  children: [
                    Image.asset('assets/images/camal.jpg'),
                    Positioned(
                        top: size.height * 0.01,
                        //     left: size.width * 0.8,
                        child: IconButton(
                          iconSize: 30,
                          icon: Icon(
                            Icons.arrow_back,
                            color: Color(0xffF5903F),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                    Positioned(
                        top: size.height * 0.01,
                        left: size.width * 0.8,
                        child: Container(
                          width: 40,
                          height: 37,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.favorite_border),
                            color: Color(0xffF5903F),
                            onPressed: () {},
                          ),
                        ))
                  ],
                ),
              ],
            )),
        ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: Stack(
              children: [
                Stack(
                  children: [
                    Image.asset('assets/images/camal.jpg'),
                    Positioned(
                        top: size.height * 0.01,
                        //     left: size.width * 0.8,
                        child: IconButton(
                          iconSize: 30,
                          icon: Icon(
                            Icons.arrow_back,
                            color: Color(0xffF5903F),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                    Positioned(
                        top: size.height * 0.01,
                        left: size.width * 0.8,
                        child: Container(
                          width: 40,
                          height: 37,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.favorite_border),
                            color: Color(0xffF5903F),
                            onPressed: () {},
                          ),
                        ))
                  ],
                ),
              ],
            )),
        ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: Stack(
              children: [
                Stack(
                  children: [
                    Image.asset('assets/images/camal.jpg'),
                    Positioned(
                        top: size.height * 0.01,
                        //     left: size.width * 0.8,
                        child: IconButton(
                          iconSize: 30,
                          icon: Icon(
                            Icons.arrow_back,
                            color: Color(0xffF5903F),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                    Positioned(
                        top: size.height * 0.01,
                        left: size.width * 0.8,
                        child: Container(
                          width: 40,
                          height: 37,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.favorite_border),
                            color: Color(0xffF5903F),
                            onPressed: () {},
                          ),
                        ))
                  ],
                ),
              ],
            )),
      ],
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
class TicketPrice extends StatelessWidget {
  TicketPrice({
    required this.txt,
    required this.price,
    super.key,
  });
  String? txt;
  String? price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DefaultText(txt: txt!, size: 20),
        Text('${price!} EGP',
            textWidthBasis: TextWidthBasis.values.first,
            style: TextStyle(fontSize: 20, color: Color(0xffF5903F))),
        DefaultText(txt: '/ TICKET ', size: 20),
      ],
    );
  }
}

// ignore: must_be_immutable
class OpeningDays extends StatelessWidget {
  OpeningDays({
    required this.txt,
    super.key,
  });
  String? txt;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DefaultText(
          txt: txt!,
          size: 20,
        ),
        Spacer(),
        DefaultText(txt: '( 07:00AM -16:00PM )', size: 20)
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
