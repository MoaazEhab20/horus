import 'package:final_project/components/custom_text.dart';
import 'package:final_project/screens/first_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
            TextForTitleL(data: 'Moaz Ehab'),

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
                      backgroundColor: Theme.of(context)
                          .primaryColorLight, //Theme.of(context).cardColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0.0,
                      shadowColor: Theme.of(context).primaryColorLight,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('ProfileSettingScreen');
                    },
                    child: Row(
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
                              color: Theme.of(context).primaryColor),
                        ),
                        Spacer(
                          flex: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Theme.of(context).primaryColor,
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
                        backgroundColor: Theme.of(context).primaryColorLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0.0,
                        shadowColor: Theme.of(context).primaryColorLight,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('SettingScreen');
                      },
                      child: Row(
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
                                color: Theme.of(context).primaryColor),
                          ),
                          Spacer(
                            flex: 5,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Theme.of(context).primaryColor,
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
                        backgroundColor: Theme.of(context).primaryColorLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0.0,
                        shadowColor: Theme.of(context).primaryColorLight,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('AboutScreen');
                      },
                      child: Row(
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
                                color: Theme.of(context).primaryColor),
                          ),
                          Spacer(
                            flex: 5,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Theme.of(context).primaryColor,
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
                              backgroundColor:
                                  Theme.of(context).primaryColorLight,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17)),
                              content: Text(
                                'Log out of your account?',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
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
                              fontSize: 18,
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
