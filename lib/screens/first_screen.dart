import 'package:final_project/screens/authview/login_tourist.dart';
import 'package:flutter/material.dart';

import 'authview/loginTourguide.dart';
import 'authview/signIn_tourguide_screen.dart';
import 'authview/signIn_tourist_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/egypt.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 21, right: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hours',
                style: TextStyle(
                    color: Color(0XFF253544),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Tourism promotion and an integrated community of tourist guides around Egypt.',
                  style: TextStyle(
                      color: Color(0XFF253544),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter'),
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 54,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen()),
                    );
                  },
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  color: const Color(0XFFF5903F),
                  child: const Text(
                    'Tourist',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Inter'),
                  ),
                ),
              ),
              const Center(
                  child: Text(
                'OR',
                style: TextStyle(
                    color: Color(0XFF253544),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter'),
              )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 54,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreenTourguide()),
                    );
                  },
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  color: const Color(0XFFF5903F),
                  child: const Text(
                    'Tour Guide',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Inter'),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
