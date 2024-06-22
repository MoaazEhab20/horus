import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/register_tour_guide__cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final email = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  final priceController = TextEditingController();
  final ssn = TextEditingController(); // New variable for SSN
  final formKey = GlobalKey<FormState>();
  String? selectedGender;
  int? selectedCityId; // New variable for selected city ID

  List<Map<String, dynamic>> languages = [
    {'name': 'Arabic', 'id': 1},
    {'name': 'English', 'id': 2},
    {'name': 'Spanish', 'id': 3},
    {'name': 'French', 'id': 4},
    {'name': 'Russian', 'id': 5},
    {'name': 'Hindi', 'id': 6},
    {'name': 'Portuguese', 'id': 7},
    {'name': 'Japanese', 'id': 8},
    {'name': 'German', 'id': 9},
  ];

  List<int> selectedLanguageIds = [];

  List<Map<String, dynamic>> cities = [
    {'name': 'Cairo', 'id': 1},
    {'name': 'Giza', 'id': 2},
    {'name': 'Alexandria', 'id': 3},
    {'name': 'Aswan', 'id': 4},
    {'name': 'Luxor', 'id': 5},
    {'name': 'Fayoum', 'id': 6},
    {'name': 'Red Sea', 'id': 7},
    {'name': 'South of Sinaa', 'id': 8},
    {'name': 'Suez', 'id': 9},
    {'name': 'Marsa Matrouh', 'id': 10},
  ];

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterTourGuideCubit(),
      child: BlocConsumer<RegisterTourGuideCubit, RegisterTourGuideState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<RegisterTourGuideCubit>(context);

          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 64),
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
                          child: TextFormField(
                            controller: name,
                            decoration: InputDecoration(
                              hintText: 'UserName',
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Color(0XFFF5903F),
                                  )),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
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
                          child: TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              hintText: 'xxx@gmail.com',
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Color(0XFFF5903F),
                                  )),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an email';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
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
                          child: TextFormField(
                            controller: phone,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: '+20',
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Color(0XFFF5903F),
                                  )),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Phone mustn\'t be empty';
                              } else if (value.length != 11) {
                                return 'Phone number is not correct';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
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
                          child: TextFormField(
                            controller: password,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              hintText: '*******',
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Color(0XFFF5903F),
                                  )),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: const Color(0XFFF5903F),
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password mustn\'t be empty';
                              } else if (value.length < 6) {
                                return 'Password must be more than 6 characters';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Confirm Password',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextFormField(
                            controller: confirmpassword,
                            obscureText: _obscureConfirmPassword,
                            decoration: InputDecoration(
                              hintText: '*******',
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Color(0XFFF5903F),
                                  )),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscureConfirmPassword =
                                        !_obscureConfirmPassword;
                                  });
                                },
                                icon: Icon(
                                  _obscureConfirmPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: const Color(0XFFF5903F),
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password mustn\'t be empty';
                              } else if (value != password.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Price',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextFormField(
                            controller: priceController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: 'Enter price',
                                hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Color(0XFFF5903F),
                                    ))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a price';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
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
                          child: DropdownButtonFormField<String>(
                            dropdownColor: Theme.of(context).primaryColorLight,
                            value: selectedGender,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedGender = newValue;
                              });
                            },
                            items: ['Male', 'Female'].map((String gender) {
                              return DropdownMenuItem<String>(
                                value: gender,
                                child: Text(
                                  gender,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Color(0XFFF5903F),
                                    ))
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'SSN',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextFormField(
                            controller: ssn,
                            decoration: InputDecoration(
                                hintText: 'SSN',
                                hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Color(0XFFF5903F),
                                    ))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'SSN mustn\'t be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'City',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: DropdownButtonFormField<int>(
                            dropdownColor: Theme.of(context).primaryColorLight,
                            value: selectedCityId,
                            onChanged: (int? newValue) {
                              setState(() {
                                selectedCityId = newValue;
                              });
                            },
                            items: cities.map((Map<String, dynamic> city) {
                              return DropdownMenuItem<int>(
                                value: city['id'],
                                child: Text(
                                  city['name']!,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Color(0XFFF5903F),
                                    ))
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        MaterialButton(
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          minWidth: double.infinity,
                          color: Theme.of(context).primaryColorLight,
                          onPressed: () {
                            RegisterTourGuideCubit.get(context)
                                .openGallery(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Choose Image',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Icon(
                                Icons.arrow_upward_rounded,
                                color: Theme.of(context).primaryColor,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Languages',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: languages.length,
                          itemBuilder: (context, index) {
                            final language = languages[index];
                            return CheckboxListTile(
                              title: Text(
                                language['name'],
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              value:
                                  selectedLanguageIds.contains(language['id']),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    selectedLanguageIds.add(language['id']);
                                  } else {
                                    selectedLanguageIds.remove(language['id']);
                                  }
                                });
                                cubit.setSelectedLanguages(selectedLanguageIds);
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: MaterialButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.RegisterTourguide(
                                      name: name.text,
                                      email: email.text,
                                      phone: phone.text,
                                      password: password.text,
                                      confpassword: confirmpassword.text,
                                      ssn: int.parse(ssn.text),
                                      gender: selectedGender ?? 'Male',
                                      nationality: 'Egyptian',
                                      cityid: selectedCityId ?? 1,
                                      languages: selectedLanguageIds,
                                      price: int.parse(priceController.text),
                                      birthdate: '2000-01-01',
                                    );
                                  }
                                },
                                color: const Color(0XFFF5903F),
                                height: 54,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('have an account?'),
                        TextButton(
                          child: const Text(
                            'Sign in',
                            style: TextStyle(color: const Color(0XFFF5903F)),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                        const SizedBox(height: 20),
                        if (state is RegisterTourguideLoading) ...[
                          const Center(child: CircularProgressIndicator()),
                        ] else if (state is RegisterTourguideFailed) ...[
                          const Center(
                            child: Text(
                              'Registration failed!',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is RegisterTourguideSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Registration successful!'),
                duration: Duration(seconds: 2),
              ),
            );
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
