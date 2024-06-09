import 'package:final_project/screens/signinview/signIn_tourguide_screen.dart';
import 'package:flutter/material.dart';

class TourGuideSignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<TourGuideSignUp> {
  //UserDataBase userDataBase;
  bool eyeIconPassword = true;
  bool eyeIconPasswordConfirm = true;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String gender = 'Male';
  TextEditingController nationality = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  String government = 'Cairo';
  TextEditingController SSN = TextEditingController();

  String errorName = '';
  String errorEmail = '';
  String errorPassword = '';
  String errorConfirmPassword = '';
  String errorNationality = '';
  String errorPhoneNumber = '';
  String errorSSN = '';

  Color colorName = Colors.white;
  Color colorEmail = Colors.white;
  Color colorPassword = Colors.white;
  Color colorConfirmPassword = Colors.white;
  Color colorNationality = Colors.white;
  Color colorPhoneNumber = Colors.white;
  Color colorSSN = Colors.white;

  @override
  void initState() {
    super.initState();
    //userDataBase = UserDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                        color: Color(0XFF253544),
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Fill tour information below',
                    style: TextStyle(
                        color: Color(0XFF253544),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 11.0),
                  child: Text(
                    'Name',
                    style: TextStyle(
                        color: Color(0XFF253544),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: name,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(196, 196, 196, 1.0)),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(245, 144, 63, 1.0)),
                        borderRadius: BorderRadius.circular(25)),
                    hintText: 'Username',
                  ),
                ),
              ),
              Text(
                errorName,
                style: TextStyle(
                    color: colorName,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 11.0),
                  child: Text(
                    'Email',
                    style: TextStyle(
                        color: Color(0XFF253544),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: const Color.fromRGBO(245, 144, 63, 1.0),
                  controller: email,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(196, 196, 196, 1.0)),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(245, 144, 63, 1.0)),
                        borderRadius: BorderRadius.circular(25)),
                    hintText: 'example@gmail.com',
                  ),
                ),
              ),
              Text(
                errorEmail,
                style: TextStyle(
                    color: colorEmail,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 11.0),
                  child: Text(
                    'Password',
                    style: TextStyle(
                        color: Color(0XFF253544),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: const Color.fromRGBO(245, 144, 63, 1.0),
                  controller: password,
                  obscureText: eyeIconPassword,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(196, 196, 196, 1.0)),
                          borderRadius: BorderRadius.circular(25)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(245, 144, 63, 1.0)),
                          borderRadius: BorderRadius.circular(25)),
                      hintText: 'Enter your Password',
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
              Text(
                errorPassword,
                style: TextStyle(
                    color: colorPassword,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 11.0),
                  child: Text(
                    'Confirm-Password',
                    style: TextStyle(
                        color: Color(0XFF253544),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: const Color.fromRGBO(245, 144, 63, 1.0),
                  controller: confirmPassword,
                  obscureText: eyeIconPasswordConfirm,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(196, 196, 196, 1.0)),
                          borderRadius: BorderRadius.circular(25)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(245, 144, 63, 1.0)),
                          borderRadius: BorderRadius.circular(25)),
                      hintText: 'Re-enter your password',
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
              Text(
                errorConfirmPassword,
                style: TextStyle(
                    color: colorConfirmPassword,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 11.0),
                  child: Text(
                    'Gender',
                    style: TextStyle(
                        color: Color(0XFF253544),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(196, 196, 196, 1.0)),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(245, 144, 63, 1.0)),
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  isExpanded: true,
                  value: gender,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
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
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 11.0),
                  child: Text(
                    'Nationality',
                    style: TextStyle(
                        color: Color(0XFF253544),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: const Color.fromRGBO(245, 144, 63, 1.0),
                  controller: nationality,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(196, 196, 196, 1.0)),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(245, 144, 63, 1.0)),
                        borderRadius: BorderRadius.circular(25)),
                    hintText: 'Enter Nationality',
                  ),
                ),
              ),
              Text(
                errorNationality,
                style: TextStyle(
                    color: colorNationality,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 11.0),
                  child: Text(
                    'Phone number',
                    style: TextStyle(
                        color: Color(0XFF253544),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: const Color.fromRGBO(245, 144, 63, 1.0),
                  controller: phoneNumber,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(196, 196, 196, 1.0)),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(245, 144, 63, 1.0)),
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ),
              Text(
                errorPhoneNumber,
                style: TextStyle(
                    color: colorPhoneNumber,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 11.0),
                  child: Text(
                    'Government',
                    style: TextStyle(
                        color: Color(0XFF253544),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(196, 196, 196, 1.0)),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(245, 144, 63, 1.0)),
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  isExpanded: true,
                  value: government,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (String? newValue) {
                    setState(() {
                      government = newValue!;
                    });
                  },
                  items: <String>[
                    'Cairo',
                    'Alexandria',
                    'Aswan',
                    'Asyut',
                    'Beheira',
                    'Beni Suef',
                    'Dakahlia',
                    'Damietta',
                    'Faiyum',
                    'Gharbia',
                    'Giza',
                    'Ismailia',
                    'Kafr El Sheikh',
                    'Luxor',
                    'Matrouh',
                    'Minya',
                    'Monufia',
                    'New Valley',
                    'North Sinai',
                    'Port Said',
                    'Qalyubia',
                    'Qena',
                    'Red Sea',
                    'Sharqia',
                    'Sohag',
                    'South Sinai',
                    'Suez'
                  ].map<DropdownMenuItem<String>>((String value) {
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
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 11.0),
                  child: Text(
                    'SSN',
                    style: TextStyle(
                        color: Color(0XFF253544),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: const Color.fromRGBO(245, 144, 63, 1.0),
                  controller: SSN,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(196, 196, 196, 1.0)),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(245, 144, 63, 1.0)),
                        borderRadius: BorderRadius.circular(25)),
                    hintText: 'Code',
                  ),
                ),
              ),
              Text(
                errorSSN,
                style: TextStyle(
                    color: colorSSN, fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                elevation: 18.0,
                color: const Color.fromRGBO(245, 144, 63, 1.0),
                clipBehavior: Clip.antiAlias,
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      if (name.text.isEmpty) {
                        errorName = "Please enter your name";
                        colorName = Colors.red;
                      }

                      if (name.text.isNotEmpty) colorName = Colors.white;

                      if (email.text.isEmpty &&
                          email.text.contains('@gmail.com') == false) {
                        errorEmail = 'Please enter your email correctly';
                        colorEmail = Colors.red;
                      }

                      if (email.text.isNotEmpty &&
                          email.text.contains('@gmail.com') == true)
                        colorEmail = Colors.white;

                      if (password.text.isEmpty && password.text.length < 6) {
                        errorPassword =
                            'Please enter 7 or more characters for your password';
                        colorPassword = Colors.red;
                      }

                      if (password.text.isNotEmpty && password.text.length >= 6)
                        colorPassword = Colors.white;

                      if (confirmPassword.text.isEmpty &&
                          confirmPassword.text != password.text) {
                        errorConfirmPassword =
                            'Please enter your confirm password correctly';
                        colorConfirmPassword = Colors.red;
                      }

                      if (confirmPassword.text.isNotEmpty &&
                          confirmPassword.text == password.text)
                        colorConfirmPassword = Colors.white;

                      if (nationality.text.isEmpty) {
                        errorNationality = 'Please enter your nationality';
                        colorNationality = Colors.red;
                      }

                      if (nationality.text.isNotEmpty)
                        colorNationality = Colors.white;

                      if (phoneNumber.text.isEmpty) {
                        errorPhoneNumber = 'Please enter your phone number';
                        colorPhoneNumber = Colors.red;
                      }

                      if (phoneNumber.text.isNotEmpty)
                        colorPhoneNumber = Colors.white;

                      if (name.text.isNotEmpty &&
                          email.text.isNotEmpty &&
                          email.text.contains('@gmail.com') == true &&
                          password.text.isNotEmpty &&
                          password.text.length > 6 &&
                          confirmPassword.text.isNotEmpty &&
                          confirmPassword.text == password.text &&
                          gender != '' &&
                          nationality.text.isNotEmpty &&
                          phoneNumber.text.isNotEmpty) {
                        
                    /*var user = User(
                      name: name.text,
                      email: email.text,
                      password: password.text,
                      gender: gender.text,
                      nationality: nationality.text,
                      phoneNumber: phoneNumber.text,
                    );
*/
                    //userDataBase.insertUser(user);

                   /* Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return SignInTourGuide();
                        })
                    );*/
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const SignInTourGuide()));
                    
                      }
                      
                    });
                  },
                  minWidth: 450.0,
                  height: 60,
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  color: Color.fromRGBO(245, 144, 63, 1.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
