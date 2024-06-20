import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool eyeIconPassword = true;
  bool eyeIconPasswordConfirm = true;
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
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
                'Change password',
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
                'Fill your new password',
                style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
               Text(
                'Password',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 15, height: 2),
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
                controller: password,
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
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0XFFD8D8D8),
                      )),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      if (eyeIconPassword == true)
                      {
                        eyeIconPassword = false;
                      }
                        else
                        {
                          eyeIconPassword = true;
                        }
                          }
                        );
                        },
                          icon: Icon(Icons.remove_red_eye, color: Color.fromRGBO(245, 144, 63, 1.0),)
                    )
                ),
              ),
               Text(
                'Confirm-Password',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 15, height: 2),
              ),
              TextFormField(
                validator: (data) {
                  if (data!.isEmpty) {
                    return '*Enter your confirm password';
                  } else if (data.toString() != password.text) {
                    return '*Please enter your confirm password correctly';
                  } else {
                    return null;
                  }
                },
                obscureText: eyeIconPasswordConfirm,
                decoration: InputDecoration(
                  hintText: 'Re-enter your password',
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
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      if (eyeIconPasswordConfirm == true)
                      {
                        eyeIconPasswordConfirm = false;
                      }
                        else
                        {
                          eyeIconPasswordConfirm = true;
                        }
                          }
                        );
                        },
                          icon: Icon(Icons.remove_red_eye, color: Color.fromRGBO(245, 144, 63, 1.0),)
                    )
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Password updated successfully')),
                      );
                  }
                },
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                color: const Color(0XFFF5903F),
                child: const Text(
                  'Confirm',
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
