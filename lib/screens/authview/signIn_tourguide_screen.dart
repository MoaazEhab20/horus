import 'package:final_project/screens/authview/signup_tourguide_screen.dart';

import 'package:final_project/widgets/custom_bottom_bar_tourguide.dart';
import 'package:flutter/material.dart';

//TourGuideSignUp()
// CustomBottomBartourguide()
//SignInTourGuide
//_SignInTourGuideState

class SignInTourGuide extends StatefulWidget {
  const SignInTourGuide({super.key});

  @override
  State<SignInTourGuide> createState() => _SignInTourGuideState();
}

class _SignInTourGuideState extends State<SignInTourGuide> {
  bool eyeIconPassword = true;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
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
                  icon: Icon(
                    Icons.arrow_circle_left_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 34,
                  )),
              const SizedBox(
                height: 35,
              ),
              Text(
                'Sign in',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 64,
                    fontWeight: FontWeight.w500,
                    fontFamily: ''),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Hi! 👋🏻 Welcome back,',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 20),
              ),
              Text(
                'you’ve been missed',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Email',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    height: 2),
              ),
              TextFormField(
                validator: (data) {
                  if (data!.isEmpty) {
                    return '*Enter your email';
                  } else if (data.endsWith('@gmail.com')) {
                    return null;
                  } else {
                    return '*please use @gmail.com';
                  }
                },
                decoration: InputDecoration(
                  hintText: 'enter your email',
                  hintStyle: const TextStyle(color: Color(0XFFD8D8D8)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0XFFF5903F),
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.red,
                      )),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.red,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0XFFD8D8D8),
                      )),
                ),
              ),
              Text(
                'Password',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    height: 2),
              ),
              TextFormField(
                validator: (data) {
                  if (data!.isEmpty) {
                    return '*Enter your password';
                  } else if (data.length <= 7) {
                    return '*please enter more than 7 character';
                  } else {
                    return null;
                  }
                },
                obscureText: eyeIconPassword,
                decoration: InputDecoration(
                    hintText: 'enter your password',
                    hintStyle: const TextStyle(color: Color(0XFFD8D8D8)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color(0XFFF5903F),
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.red,
                        )),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.red,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color(0XFFD8D8D8),
                        )),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (eyeIconPassword == true) {
                              eyeIconPassword = false;
                            } else {
                              eyeIconPassword = true;
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.remove_red_eye,
                          color: Color.fromRGBO(245, 144, 63, 1.0),
                        ))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forget password ?',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 13,
                          height: 2),
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
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CustomBottomBartourguide()));
                  }
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
                  Text(
                    'Don’t have an account?',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 13,
                        height: 2),
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
