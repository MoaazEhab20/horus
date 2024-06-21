import 'package:flutter/material.dart';

import 'verification screen.dart';

class EmailPage extends StatefulWidget {
  EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  TextEditingController email = TextEditingController();
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
                icon: const Icon(
                  Icons.arrow_circle_left_outlined,
                  size: 34,
                ),
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                'Email Verification',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    fontFamily: ''),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Fill your email to complete the process',
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
                controller: email,
                decoration: InputDecoration(
                  hintText: 'example@gmail.com',
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
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0XFFD8D8D8),
                      )),
                ),
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
                        builder: (context) => VerificationScreen(),
                      ),
                    );
                  }
                },
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                color: const Color(0XFFF5903F),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
