import 'package:flutter/material.dart';


class TouristSignUp extends StatefulWidget
{

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<TouristSignUp> {
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
  String errorName = '';
  String errorEmail = '';
  String errorPassword = '';
  String errorConfirmPassword = '';
  String errorNationality = '';
  String errorPhoneNumber = '';
  Color colorName = Colors.white;
  Color colorEmail = Colors.white;
  Color colorPassword = Colors.white;
  Color colorConfirmPassword = Colors.white;
  Color colorNationality = Colors.white;
  Color colorPhoneNumber = Colors.white;


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
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(onPressed: () {
                  // Add your functionality here
                  Navigator.pop(context); // For example, pop the current screen
                  }, icon: Icon(Icons.arrow_back)),
              ),
              SizedBox(height: 40,),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Create Account', style: TextStyle(
                      color: Color(0XFF253544),
                      fontSize: 45,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Fill tour information below', style: TextStyle(
                      color: Color(0XFF253544),
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text('Name', style: TextStyle(
                      color: Color(0XFF253544),
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: name,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(196, 196, 196, 1.0)),
                        borderRadius: BorderRadius.circular(25)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(245, 144, 63, 1.0)),
                        borderRadius: BorderRadius.circular(25)
                    ),
                    hintText: 'Username',
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text(errorName, style: TextStyle(color: colorName, fontSize: 14, fontWeight: FontWeight.bold),),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text('Email', style: TextStyle(
                      color: Color(0XFF253544),
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: Color.fromRGBO(245, 144, 63, 1.0),
                  controller: email,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(196, 196, 196, 1.0)),
                        borderRadius: BorderRadius.circular(25)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(245, 144, 63, 1.0)),
                        borderRadius: BorderRadius.circular(25)
                    ),
                    hintText: 'example@gmail.com',
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text(errorEmail, style: TextStyle(color: colorEmail, fontSize: 14, fontWeight: FontWeight.bold),),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text('Password', style: TextStyle(
                      color: Color(0XFF253544),
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: Color.fromRGBO(245, 144, 63, 1.0),
                  controller: password,
                  obscureText: eyeIconPassword,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(196, 196, 196, 1.0)),
                          borderRadius: BorderRadius.circular(25)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(245, 144, 63, 1.0)),
                          borderRadius: BorderRadius.circular(25)
                      ),
                      hintText: 'Enter your Password',
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
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text(errorPassword, style: TextStyle(color: colorPassword, fontSize: 14, fontWeight: FontWeight.bold),),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text('Confirm-Password', style: TextStyle(
                      color: Color(0XFF253544),
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: Color.fromRGBO(245, 144, 63, 1.0),
                  controller: confirmPassword,
                  obscureText: eyeIconPasswordConfirm,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(196, 196, 196, 1.0)),
                          borderRadius: BorderRadius.circular(25)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(245, 144, 63, 1.0)),
                          borderRadius: BorderRadius.circular(25)
                      ),
                      hintText: 'Re-enter your password',
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
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text(errorConfirmPassword, style: TextStyle(color: colorConfirmPassword, fontSize: 14, fontWeight: FontWeight.bold),),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text('Gender', style: TextStyle(
                      color: Color(0XFF253544),
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(196, 196, 196, 1.0)),
                          borderRadius: BorderRadius.circular(25)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(245, 144, 63, 1.0)),
                          borderRadius: BorderRadius.circular(25)
                      ),
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
              SizedBox(height: 21,),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text('Nationality', style: TextStyle(
                      color: Color(0XFF253544),
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    cursorColor: Color.fromRGBO(245, 144, 63, 1.0),
                    controller: nationality,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(196, 196, 196, 1.0)),
                          borderRadius: BorderRadius.circular(25)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(245, 144, 63, 1.0)),
                          borderRadius: BorderRadius.circular(25)
                      ),
                      hintText: 'Egypt',
                    ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text(errorNationality, style: TextStyle(color: colorNationality, fontSize: 14, fontWeight: FontWeight.bold),),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text('Phone number', style: TextStyle(
                      color: Color(0XFF253544),
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: Color.fromRGBO(245, 144, 63, 1.0),
                  controller: phoneNumber,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(196, 196, 196, 1.0)),
                        borderRadius: BorderRadius.circular(25)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(245, 144, 63, 1.0)),
                        borderRadius: BorderRadius.circular(25)
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text(errorPhoneNumber, style: TextStyle(color: colorPhoneNumber, fontSize: 14, fontWeight: FontWeight.bold),),
                ),
              ),
              SizedBox(height: 10,),
              Material(
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
                elevation: 18.0,
                color: Color.fromRGBO(245, 144, 63, 1.0),
                clipBehavior: Clip.antiAlias,
                child: MaterialButton(onPressed: () {
                  setState(() {
                    if (name.text.isEmpty)
                    {
                      errorName = "* Please enter your name";
                      colorName = Colors.red;
                    }

                    if (name.text.isNotEmpty)
                      colorName = Colors.white;

                    if (email.text.isEmpty && email.text.contains('@gmail.com') == false) {
                      errorEmail = '* Please enter your email correctly';
                      colorEmail = Colors.red;
                    }

                    if (email.text.isNotEmpty && email.text.contains('@gmail.com') == true)
                      colorEmail = Colors.white;

                    if (password.text.isEmpty && password.text.length < 6) {
                      errorPassword = '* Please enter 7 or more characters for your password';
                      colorPassword = Colors.red;
                    }

                    if (password.text.isNotEmpty && password.text.length >= 6)
                      colorPassword = Colors.white;

                    if (confirmPassword.text.isEmpty && confirmPassword.text != password.text) {
                      errorConfirmPassword = '* Please enter your confirm password correctly';
                      colorConfirmPassword = Colors.red;
                    }

                    if (confirmPassword.text.isNotEmpty && confirmPassword.text == password.text)
                      colorConfirmPassword = Colors.white;

                    if (nationality.text.isEmpty) {
                      errorNationality = '* Please enter your nationality';
                      colorNationality = Colors.red;
                    }

                    if (nationality.text.isNotEmpty)
                      colorNationality = Colors.white;

                    if (phoneNumber.text.isEmpty) {
                      errorPhoneNumber = '* Please enter your phone number';
                      colorPhoneNumber = Colors.red;
                    }

                    if (phoneNumber.text.isNotEmpty)
                      colorPhoneNumber = Colors.white;

                    if(name.text.isNotEmpty && email.text.isNotEmpty && email.text.contains('@gmail.com') == true && password.text.isNotEmpty && password.text.length > 6 && confirmPassword.text.isNotEmpty && confirmPassword.text == password.text && gender != '' && nationality.text.isNotEmpty && phoneNumber.text.isNotEmpty) {
                      /*
                    var user = User(
                      name: name.text,
                      email: email.text,
                      password: password.text,
                      gender: gender.text,
                      nationality: nationality.text,
                      phoneNumber: phoneNumber.text,
                    );

                    //userDataBase.insertUser(user);

                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return LogIn();
                        })
                    );
                    */
                    }
                  });
                },
                  minWidth: 450.0,
                  height: 60,
                  child: Text('Sign up', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
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