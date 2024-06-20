import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/customTextForm.dart';
import '../../components/nationalities.dart';
import '../../cubit/auth_cubit.dart';
import 'login_tourist.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final email = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? selectedNationality;
  String? selectedGender; // New variable for selected gender

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 60),
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
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            'Create Account',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Fill your information below',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 35),
                          Text(
                            'Name',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CustomForm(
                              controller: name,
                              hint: 'UserName',
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Email',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CustomForm(
                              controller: email,
                              hint: 'xxx@gmail.com',
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Phone Number',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CustomForm(
                              type: TextInputType.phone,
                              controller: phone,
                              hint: '+20',
                              fun: (value) {
                                if (phone.text.isEmpty) {
                                  return 'Phone Mustn`t Be Empty';
                                } else if (phone.text.length != 11) {
                                  return 'Phone Number Is Not Correct';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Password',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CustomForm(
                              controller: password,
                              hint: '*******',
                              fun: (value) {
                                if (password.text.isEmpty) {
                                  return 'Password Mustn`t Be Empty';
                                } else if (password.text.length < 6) {
                                  return 'Password Must Be More Than 6 Digit ';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Confirm-Password',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CustomForm(
                              controller: confirmpassword,
                              hint: '*******',
                              fun: (value) {
                                if (confirmpassword.text.isEmpty) {
                                  return 'Password Mustn`t Be Empty';
                                } else if (confirmpassword.text.length < 6) {
                                  return 'Password Must Be More Than 6 Digit ';
                                } else if (confirmpassword.text != password.text) {
                                  return 'Passwords do not match';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Gender', 
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.0, color: Colors.grey),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          dropdownColor: Theme.of(context).primaryColorLight,
                                          isExpanded: true,
                                          value: selectedGender,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedGender = newValue!;
                                            });
                                          },
                                          items: ['Male', 'Female'].map((String gender) {
                                            return DropdownMenuItem<String>(
                                              value: gender,
                                              child: Text(
                                                gender,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            );
                                          }).toList(),
                                          icon: const Icon(Icons.arrow_drop_down),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Nationality',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.0, color: Colors.grey),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          dropdownColor: Theme.of(context).primaryColorLight,
                                          isExpanded: true,
                                          value: selectedNationality,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedNationality = newValue!;
                                            });
                                          },
                                          items: nationalities.map((String nationality) {
                                            return DropdownMenuItem<String>(
                                              value: nationality,
                                              child: Text(
                                                nationality,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            );
                                          }).toList(),
                                          icon: const Icon(Icons.arrow_drop_down),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MaterialButton(
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                        color: const Color(0XFFF5903F),
                        minWidth: double.infinity,
                        height: 50,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context).Register(
                              name: name.text,
                              phone: phone.text,
                              password: password.text,
                              email: email.text,
                              confpassword: confirmpassword.text,
                              gender: selectedGender ?? '',
                              nationality: selectedNationality ?? '',
                            );
                          }
                        },
                        child: Text(
                          state is RegisterLoading ? 'Loading....' : 'Register',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LoginScreen();
              },
            ),
          );
        } else if (state is RegisterFailed) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.redAccent,
                content: Text(state.message),
              );
            },
          );
        }
      },
    );
  }
}
