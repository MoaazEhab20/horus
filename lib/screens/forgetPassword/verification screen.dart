import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import 'new password screen.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String _verificationCode = "";

  /* Future<bool> verifyCode(String code) async {
    final response = await http.post(
      Uri.parse('https://your-api.com/verify-code'),
      body: {'code': code},
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
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
            SizedBox(height: 30,),
            TextButton(
              onPressed: () {
                // Verify the code here
                print("Verification code: $_verificationCode");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPasswordScreen(),
                      ),
                    );
              },
              child: Text("Verify"),
            ),
          ],
        ),
      ),
    );
  }
}
