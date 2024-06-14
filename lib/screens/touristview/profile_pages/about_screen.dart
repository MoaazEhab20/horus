import 'package:final_project/components/custom_text.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25),
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
        title: TextForTitleL(data: 'About Hours'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 20),
            _buildInfoCard(context),
            _buildCenteredTitle('Supervised By'),
            _buildSupervisedBy(context),
            _buildCenteredTitle('Developed By'),
            _buildDevelopedBy(context),
            const SizedBox(height: 20),
            Center(
              child: Text(
                '© 2024 Hours. All rights reserved.',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: "Inter",
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        color: const Color(0xffD9D9D9),
      ),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width*0.40,
                  child: const Text(
                    'Our Greetings and foremost, we sincerely hope that the application has successfully garnered your utmost satisfaction.',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      color: Color(0xff253544),
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/giza.png',
                  width: size.width*0.30,
                  height: size.height*.30,
                ),
              ],
            ),
            //const SizedBox(height: 10),
            const Text(
              'Allow us to elucidate that this application was conceived as the graduation project at the Faculty of Computer Science. It served as a magnificent culmination of our academic journey. The underlying concept behind this app revolved around amalgamating all the splendid tourist destinations nestled within the land of Egypt. Our primary objective was to acquaint visitors and all people with these extraordinary locales while also streamlining their accessibility.',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                color: Color(0xff253544),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'It also became clear that the guardians charged with developing and maintaining this magnificent space were in dire need of a dynamic mobile application for tourists.',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                color: Color(0xff253544),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenteredTitle(String title) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextForTitleL(data: title),
      ),
    );
  }

  Widget _buildSupervisedBy(BuildContext context) {
    return Container(
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
            const SizedBox(width: 12),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. Mostafa Thabet',
                    style: TextStyle(
                      color: Color(0xff253544),
                      fontFamily: "Inter",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Lecturer at the Faculty of Computer and Artificial Intelligence, Fayoum University',
                    style: TextStyle(
                      color: Color(0xff253544),
                      fontFamily: "Inter",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDevelopedBy(BuildContext context) {
    return Column(
      children: [
        _buildDeveloperRow(
          context,
          'assets/images/lamei.jpg',
          'Eng. Youssef Lamei',
          'assets/images/essam.jpg',
          'Eng. Youssef Essam',
        ),
        const SizedBox(height: 10),
        _buildDeveloperRow(
          context,
          'assets/images/adham.jpg',
          'Eng. Adham Hamdy',
          'assets/images/moaaz.jpg',
          'Eng.  Moaaz Ehab',
        ),
        const SizedBox(height: 10),
        _buildDeveloperRow(
          context,
          'assets/images/sayed.jpg',
          'Eng. Youssef Mohamed',
          'assets/images/magdy.jpg',
          'Eng. Mohamed Magdy',
        ),
      ],
    );
  }

  Widget _buildDeveloperRow(
    BuildContext context,
    String imagePath1,
    String name1,
    String imagePath2,
    String name2,
  ) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(27),
      ),
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: const Color(0xffD9D9D9),
              backgroundImage: AssetImage(imagePath1),
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: size.width * 0.22,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name1,
                    style: const TextStyle(
                      color: Color(0xff253544),
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: const Color(0xffD9D9D9),
              backgroundImage: AssetImage(imagePath2),
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: size.width * 0.22,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name2,
                    style: const TextStyle(
                      color: Color(0xff253544),
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}