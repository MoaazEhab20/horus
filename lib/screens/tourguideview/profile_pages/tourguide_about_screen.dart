import 'package:flutter/material.dart';

import '../../../components/custom_text.dart';

class TourguideAboutScreen extends StatelessWidget {
  const TourguideAboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 25),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_circle_left_outlined,
              color: Theme.of(context).primaryColor,
              size: 32,
            ),
          ),
        ),
        title:
            Text('About Hours', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27),
                color: const Color(0xffD9D9D9),
              ),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 15, right: 15, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: const Column(
                            children: [
                              Text(
                                'Our Greetings and foremost, we sincerely hope that the application has successfully garnered your utmost satisfaction.',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff253544)),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/images/giza.png',
                          width: 128,
                          height: 128,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Allow us to elucidate that this application was conceived as the graduation project at the Faculty of Computer Science. It served as a magnificent culmination of our academic journey. The underlying concept behind this app revolved around amalgamating all the splendid tourist destinations nestled within the  land of Egypt. Our primary objective was to acquaint visitors and all people with these extraordinary locales while also streamlining their accessibility.',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: Color(0xff253544),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'It also became clear that the guardians charged with developing and maintaining this magnificent space were in dire need of a dynamic mobile application for tourists.',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: Color(0xff253544),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextForTitleL(data: 'Supervised By'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(27),
              ),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundColor: Color(0xffD9D9D9),
                      backgroundImage: AssetImage('assets/images/Dr.jpg'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Dr. Mostafa Thabet',
                            style: TextStyle(
                                color: Color(0xff253544),
                                fontFamily: "Inter",
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'lecturer at the faculty of computer and artificial intelligence,fayoum university ',
                            style: TextStyle(
                                color: Color(0xff253544),
                                fontFamily: "Inter",
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextForTitleL(data: 'Developed By'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(27),
              ),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xffD9D9D9),
                      backgroundImage: AssetImage('assets/images/lamei.jpg'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.22,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Eng. youssef Lamei',
                            style: TextStyle(
                                color: Color(0xff253544),
                                fontFamily: "Inter",
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xffD9D9D9),
                      backgroundImage: AssetImage('assets/images/essam.jpg'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.22,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Eng. Youssef Essam',
                            style: TextStyle(
                                color: Color(0xff253544),
                                fontFamily: "Inter",
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(27),
              ),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xffD9D9D9),
                      backgroundImage: AssetImage('assets/images/adham.jpg'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.22,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Eng. Adham Hamdy',
                            style: TextStyle(
                                color: Color(0xff253544),
                                fontFamily: "Inter",
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xffD9D9D9),
                      backgroundImage: AssetImage('assets/images/moaaz.jpg'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.22,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Eng. Moaaz Ehab',
                            style: TextStyle(
                                color: Color(0xff253544),
                                fontFamily: "Inter",
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(27),
              ),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xffD9D9D9),
                      backgroundImage: AssetImage('assets/images/sayed.jpg'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.22,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Eng. Youssef mohamed',
                            style: TextStyle(
                                color: Color(0xff253544),
                                fontFamily: "Inter",
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xffD9D9D9),
                      backgroundImage: AssetImage('assets/images/magdy.jpg'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.22,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Eng. Mohamed Magdy',
                            style: TextStyle(
                                color: Color(0xff253544),
                                fontFamily: "Inter",
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                ' © 2024 Hours . all rights reserved.',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: "Inter",
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
