import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import 'new password screen.dart';

class VerificationScreenTourguide extends StatefulWidget {
  @override
  final String Email;
  final String Email_type;

  const VerificationScreenTourguide(
      {super.key, required this.Email, required this.Email_type});

  _VerificationScreenTourguideState createState() =>
      _VerificationScreenTourguideState();
}

class _VerificationScreenTourguideState
    extends State<VerificationScreenTourguide> {
  String _verificationCode = "";
  var form_key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: form_key,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                height: 50,
              ),
              Text(
                'Verify code',
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
                'Please enter the code we just sent to your email',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 20),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: VerificationCode(
                  length: 4,
                  onCompleted: (code) {
                    setState(() {
                      _verificationCode = code;
                    });
                  },
                  onEditing: (bool value) {
                    print("Editing: $value");
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  print("Verification code: $_verificationCode");
                  if (form_key.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewPasswordScreenTourGuide(
                          email: widget.Email,
                          otp: _verificationCode,
                          email_type: widget.Email_type,
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  "Verify",
                  style: TextStyle(
                    color: Color(0XFFF5903F),
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
