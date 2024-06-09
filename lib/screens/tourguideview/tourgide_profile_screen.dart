import 'package:flutter/material.dart';

import '../first_screen.dart';

class TourguideProfileScreen extends StatelessWidget {
  const TourguideProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Center(
              child: CircleAvatar(
                radius: 65,
                backgroundImage:
                    AssetImage('assets/images/Dave-Dickinson-Headshot.jpg'),
              ),
            ),
            const SizedBox(height: 15),
            Text('Moaz Ehab', style: Theme.of(context).textTheme.titleLarge),

            //button 1
            const SizedBox(height: 62),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF5F5F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0.0,
                      shadowColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('TourguideProfileSettingScreen');
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.person_outlined,
                          color: Color(0xffF5903F),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Text(
                          'Profile Setting',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff253544)),
                        ),
                        Spacer(
                          flex: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Color(0xff253544),
                        ),
                      ],
                    ),
                  ),
                ),

                //button 2

                Padding(
                  padding: const EdgeInsets.only(top: 13.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffF5F5F5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0.0,
                        shadowColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed('TourguideSettingScreen');
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.settings_outlined,
                            color: Color(0xffF5903F),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Text(
                            'Settings',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff253544)),
                          ),
                          Spacer(
                            flex: 5,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Color(0xff253544),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //button 3

                Padding(
                  padding: const EdgeInsets.only(top: 13.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffF5F5F5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0.0,
                        shadowColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('TourguideAboutScreen');
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.assignment_late_outlined,
                            color: Color(0xffF5903F),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Text(
                            'About',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff253544)),
                          ),
                          Spacer(
                            flex: 5,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Color(0xff253544),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //log out

                Padding(
                  padding: const EdgeInsets.only(top: 64.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFFF5903F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                        shadowColor: Colors.white,
                      ),
                      onPressed: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Color(0xffD9D9D9),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17)),
                              content: Text(
                                'Log out of your account?',
                                style: TextStyle(
                                    color: Color(0xff253544),
                                    fontFamily: "Inter",
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FirstScreen()),
                                        (route) => false);
                                  },
                                  child: Text(
                                    'log out',
                                    style: TextStyle(
                                        color: Color(0xffF5903F),
                                        fontFamily: "Inter",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'cancel',
                                    style: TextStyle(
                                        color: Color(0xff00A6A6),
                                        fontFamily: "Inter",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 115,
                          ),
                          Text(
                            'Log Out',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Icon(Icons.exit_to_app)
                        ],
                      ),
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
