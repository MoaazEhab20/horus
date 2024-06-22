import 'package:final_project/screens/touristview/booking_pages/booking_screen.dart';
import 'package:flutter/material.dart';

import '../../../models/tourguide_model.dart';

class detailsTourguide extends StatelessWidget {
  final TourGuide tourGuide;

  const detailsTourguide({super.key, required this.tourGuide});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            Image.network(tourGuide.profilePic),
                            IconButton(
                              iconSize: 30,
                              icon: Icon(
                                Icons.arrow_back,
                                color: Color(0xffF5903F),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    )),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      'Name :',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      tourGuide.name,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 9,
                ),
                Row(
                  children: [
                    Text(
                      'Languages :',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      tourGuide.languages
                          .map((language) => language.name)
                          .join(', '),
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 9,
                ),
                Row(
                  children: [
                    Text(
                      'Price / Per hour :',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      '${tourGuide.price}\E£',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 140,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffF5903F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0.0,
                      shadowColor: Theme.of(context).primaryColorLight,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookingTourguide(
                                    tourGuide: tourGuide,
                                  )));
                    },
                    child: Row(
                      children: [
                        Spacer(
                          flex: 1,
                        ),
                        Text(
                          'Book',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                      ],
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
