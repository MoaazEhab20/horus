import 'package:final_project/screens/signupview/signup_tourguide_screen.dart';

import 'package:final_project/widgets/custom_bottom_bar_tourguide.dart';
import 'package:flutter/material.dart';

class SignInTourGuide extends StatefulWidget {
  const SignInTourGuide({super.key});

  @override
  State<SignInTourGuide> createState() => _SignInTourGuideState();
}

class _SignInTourGuideState extends State<SignInTourGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              IconButton(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_circle_left_outlined,
                    size: 28,
                  )),
              const SizedBox(
                height: 35,
              ),
              const Text(
                'Sign in',
                style: TextStyle(
                    color: Color(0XFF253544),
                    fontSize: 64,
                    fontWeight: FontWeight.w500,
                    fontFamily: ''),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Hi! 👋🏻 Welcome back,',
                style: TextStyle(color: Color(0XFF253544), fontSize: 20),
              ),
              const Text(
                'you’ve been missed',
                style: TextStyle(color: Color(0XFF253544), fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Email',
                style: TextStyle(
                    color: Color(0XFF253544), fontSize: 15, height: 2),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'enter your email',
                  hintStyle: const TextStyle(color: Color(0XFFD8D8D8)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0XFFF5903F),
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0XFFD8D8D8),
                      )),
                ),
              ),
              const Text(
                'Password',
                style: TextStyle(
                    color: Color(0XFF253544), fontSize: 15, height: 2),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'enter your password',
                  hintStyle: const TextStyle(color: Color(0XFFD8D8D8)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0XFFF5903F),
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0XFFD8D8D8),
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Forget password ?',
                      style: TextStyle(
                          color: Color(0XFF253544), fontSize: 13, height: 2),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                height: 54,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const CustomBottomBartourguide()));
                },
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                color: const Color(0XFFF5903F),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don’t have an account?',
                    style: TextStyle(
                        color: Color(0XFF253544), fontSize: 13, height: 2),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TourGuideSignUp()));
                    },
                    child: const Text(
                      ' Sign up',
                      style: TextStyle(
                          color: Color(0XFFF5903F), fontSize: 15, height: 2),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
