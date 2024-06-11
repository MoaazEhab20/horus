import 'package:final_project/screens/touristview/booking_pages/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../components/custom_text.dart';

class bookingTourguide extends StatefulWidget {
  const bookingTourguide({super.key});

  @override
  State<bookingTourguide> createState() => _bookingTourguideState();
}

class _bookingTourguideState extends State<bookingTourguide> {
  TextEditingController fromTime = TextEditingController();
  TextEditingController toTime = TextEditingController();
  TextEditingController location = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 25),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_circle_left_outlined,
              color: Theme.of(context).primaryColor,
              size: 32,
            ),
          ),
        ),
        title: TextForTitleL(data: 'Time'),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal:24.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Spacer(flex: 1,),
              TextFormField(
                keyboardType: TextInputType.datetime,
                textAlign: TextAlign.center,
                controller: fromTime,
                validator: (data) {
                  final format = DateFormat('HH:mm');
                  DateTime? inputTime;
                  try {
                  inputTime = format.parse(data.toString());
                  } catch (e) {
                    return '*Invalid time format';
                    }
                  final startTime = format.parse('09:00');
                  final endTime = format.parse('20:00');

                  if (data!.isEmpty) {
                    return '*Please fill this field';
                  } else if (inputTime.isBefore(startTime) || inputTime.isAfter(endTime)) {
                    return '*Time must be between 09:00 and 20:00';
                    } else {
                      return null;
                    }
                },
                decoration: InputDecoration(
                  labelText: 'From',labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  hintText: 'TT',hintStyle: TextStyle(color: Colors.grey,fontSize: 16),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16),),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Color(0xffF5903F),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.datetime,
                textAlign: TextAlign.center,
                controller: toTime,
                validator: (data) {
                  final format = DateFormat('HH:mm');
                  DateTime? toInputTime;
                  DateTime? fromInputTime;
                  try {
                  toInputTime = format.parse(data.toString());
                  fromInputTime = format.parse(fromTime.text.toString());
                  } catch (e) {
                    return '*Invalid time format';
                    }
                  final startTime = format.parse('10:00');
                  final endTime = format.parse('21:00');

                  if (data!.isEmpty) {
                    return '*Please fill this field';
                  } else if (toInputTime.isBefore(startTime) || toInputTime.isAfter(endTime)) {
                    return '*Time must be between 10:00 and 21:00';
                  } else if (toInputTime.isBefore(fromInputTime)) {
                    return '*Timing error, try another time';
                  }else if (toInputTime.difference(fromInputTime).inMinutes < 60) {
                    return '*Your time is less than one hour, try another time';
                  } else {
                      return null;
                  }
                },
                decoration: InputDecoration(
                  labelText: 'To',labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  hintText: 'TT',hintStyle: TextStyle(color: Colors.grey,fontSize: 16),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16),),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Color(0xffF5903F),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                textAlign: TextAlign.center,
                controller: location,
                validator: (data) {
                  if (data!.isEmpty) {
                    return '*Please fill this field';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Location',labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  hintText: 'LL',hintStyle: TextStyle(color: Colors.grey,fontSize: 16),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16),),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Color(0xffF5903F),
                    ),
                  ),
                ),
              ),
              Spacer(flex: 1,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => const creditCard()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    backgroundColor: Color(0xffF5903F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  child: Text(
                    'CONFIRM',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Spacer(flex: 2,),
            ],
          ),
        ),
      ),
    );
  }
}