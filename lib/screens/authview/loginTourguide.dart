import 'package:final_project/screens/authview/register_tourguide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/customTextForm.dart';
import '../../cubit/register_tour_guide__cubit.dart';
import '../../widgets/custom_bottom_bar_tourguide.dart';
import '../tourguideview/forgetPassword tourguide/email screen.dart';

class LoginScreenTourguide extends StatelessWidget {
  LoginScreenTourguide({super.key});
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<RegisterTourGuideCubit, RegisterTourGuideState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 80),
                        IconButton(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_circle_left_outlined,
                              size: 34),
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(height: 35),
                        const Text(
                          'Sign in ',
                          style: TextStyle(
                              fontSize: 60, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10),
                        const Text('Hi! 👋🏻 Welcome back, ',
                            style: TextStyle(fontSize: 20)),
                        const Text('you’ve been missed ',
                            style: TextStyle(fontSize: 20)),
                        const SizedBox(height: 20),
                        const Text('Email'),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: size.width,
                          child: CustomForm(
                            hint: 'Enter Your Email',
                            controller: email,
                            icon: const Icon(Icons.email),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text('Password'),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: size.width,
                          child: CustomForm(
                            fun: (value) {
                              if (password.text.isEmpty) {
                                return 'Password Mustn`t Be Empty';
                              } else if (password.text.length < 6) {
                                return 'Password Must Be More Than 6 Digits';
                              } else {
                                return null;
                              }
                            },
                            secure: true,
                            hint: 'Enter Your Password',
                            controller: password,
                            icon: const Icon(Icons.password),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EmailPageTourguide(),
                                  ),
                                );
                              },
                              child: Text(
                                'Forget password ?',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 13,
                                  height: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          height: 54,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          color: const Color(0XFFF5903F),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<RegisterTourGuideCubit>(context)
                                  .LoginTourguide(
                                email: email.text,
                                password: password.text,
                              );
                            }
                          },
                          child: Text(
                            state is LoginLoading ? 'Loading..' : 'Sign in',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don’t have an account?'),
                            TextButton(
                              child: const Text(
                                'Sign up',
                                style: TextStyle(color: Color(0XFFF5903F)),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const RegisterScreen();
                                  },
                                ));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is LoginSuccess) {
          print('Login Successful - Navigating to CustomBottomBartourguide');
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return CustomBottomBartourguide();
            },
          ));
        } else if (state is LoginFailed) {
          print('Login Failed - Showing error dialog');
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.red,
                content: Text('Email OR Password Error'),
              );
            },
          );
        }
      },
    );
  }
}
