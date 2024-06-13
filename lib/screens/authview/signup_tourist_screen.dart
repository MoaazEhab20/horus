import 'package:flutter/material.dart';

class TouristSignUp extends StatefulWidget {
  const TouristSignUp({super.key});

  @override
  State<TouristSignUp> createState() => _SignUpState();
}

class _SignUpState extends State<TouristSignUp> {
  bool eyeIconPassword = true;
  bool eyeIconPasswordConfirm = true;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String gender = 'Male';
  TextEditingController nationality = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
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
                  height: 30,
                ),
                Text(
                  'Create Account',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Fill tour information below',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 35,
                ),
                Text(
                  'Name',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: name,
                    validator: (data) {
                      if (data!.isEmpty) {
                        return '*Please enter your name';
                      } else {
                        return null;
                      }
                    },
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(196, 196, 196, 1.0),
                              width: 1),
                          borderRadius: BorderRadius.circular(50)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.circular(50)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(245, 144, 63, 1.0),
                              width: 1),
                          borderRadius: BorderRadius.circular(50)),
                      hintText: 'Username',
                      hintStyle: const TextStyle(color: Color(0XFFD8D8D8)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Email',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    cursorColor: const Color.fromRGBO(245, 144, 63, 1.0),
                    controller: email,
                    validator: (data) {
                      if (data!.isEmpty) {
                        return '*Please enter your email';
                      } else if (data.toString().contains('@gmail.com') ==
                          false) {
                        return '*Please enter your email correctly';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(196, 196, 196, 1.0),
                              width: 1),
                          borderRadius: BorderRadius.circular(50)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.circular(50)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(245, 144, 63, 1.0),
                              width: 1),
                          borderRadius: BorderRadius.circular(50)),
                      hintText: 'example@gmail.com',
                      hintStyle: const TextStyle(color: Color(0XFFD8D8D8)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    cursorColor: const Color.fromRGBO(245, 144, 63, 1.0),
                    controller: password,
                    validator: (data) {
                      if (data!.isEmpty) {
                        return '*Please enter your password';
                      } else if (data.length <= 7) {
                        return '* Please enter 7 or more characters for your password';
                      } else {
                        return null;
                      }
                    },
                    obscureText: eyeIconPassword,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(196, 196, 196, 1.0),
                                width: 1),
                            borderRadius: BorderRadius.circular(50)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.circular(50)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(245, 144, 63, 1.0),
                                width: 1),
                            borderRadius: BorderRadius.circular(50)),
                        hintText: 'Enter your Password',
                        hintStyle: const TextStyle(color: Color(0XFFD8D8D8)),
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
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Confirm-Password',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    cursorColor: const Color.fromRGBO(245, 144, 63, 1.0),
                    controller: confirmPassword,
                    validator: (data) {
                      if (data!.isEmpty) {
                        return '*Please enter your confirm password';
                      } else if (data.toString() != password.text) {
                        return '*Please enter your confirm password correctly';
                      } else {
                        return null;
                      }
                    },
                    obscureText: eyeIconPasswordConfirm,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(196, 196, 196, 1.0),
                                width: 1),
                            borderRadius: BorderRadius.circular(50)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.circular(50)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(245, 144, 63, 1.0),
                                width: 1),
                            borderRadius: BorderRadius.circular(50)),
                        hintText: 'Re-enter your password',
                        hintStyle: const TextStyle(color: Color(0XFFD8D8D8)),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (eyeIconPasswordConfirm == true) {
                                  eyeIconPasswordConfirm = false;
                                } else {
                                  eyeIconPasswordConfirm = true;
                                }
                              });
                            },
                            icon: const Icon(
                              Icons.remove_red_eye,
                              color: Color.fromRGBO(245, 144, 63, 1.0),
                            ))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Gender',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(196, 196, 196, 1.0),
                              width: 1),
                          borderRadius: BorderRadius.circular(50)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.circular(50)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(245, 144, 63, 1.0),
                              width: 1),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    isExpanded: true,
                    value: gender,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Color(0XFFD8D8D8)),
                    onChanged: (String? newValue) {
                      setState(() {
                        gender = newValue!;
                      });
                    },
                    items: <String>['Male', 'Female']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                Text(
                  'Nationality',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    cursorColor: const Color.fromRGBO(245, 144, 63, 1.0),
                    controller: nationality,
                    validator: (data) {
                      if (data!.isEmpty) {
                        return '*Please enter your nationality';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(196, 196, 196, 1.0),
                              width: 1),
                          borderRadius: BorderRadius.circular(50)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.circular(50)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(245, 144, 63, 1.0),
                              width: 1),
                          borderRadius: BorderRadius.circular(50)),
                      hintText: 'Egypt',
                      hintStyle: const TextStyle(color: Color(0XFFD8D8D8)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Phone number',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    cursorColor: const Color.fromRGBO(245, 144, 63, 1.0),
                    controller: phoneNumber,
                    validator: (data) {
                      if (data!.isEmpty) {
                        return '*Please enter your phone number';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(196, 196, 196, 1.0),
                              width: 1),
                          borderRadius: BorderRadius.circular(50)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.circular(50)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(245, 144, 63, 1.0),
                              width: 1),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 54,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      //registerTorist();
                      Navigator.pop(context);
                    }
                  },
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  color: const Color(0XFFF5903F),
                  child: const Text(
                    'Sign up',
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
                      'have an account?',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 13,
                          height: 2),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        ' Sign in',
                        style: TextStyle(
                            color: Color(0XFFF5903F), fontSize: 15, height: 2),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
