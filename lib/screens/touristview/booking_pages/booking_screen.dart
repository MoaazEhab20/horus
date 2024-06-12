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
  TextEditingController date = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 2)),
      firstDate: DateTime.now().add(Duration(days: 2)),
      lastDate: DateTime(2025),
    );

    if (_picked != null) {
      setState(() {
        date.text = _picked.toString().split(" ")[0];
      });
    }
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Spacer(flex: 1,),
              TextFormField(
                textAlign: TextAlign.center,
                controller: date,
                validator: (data) {
                  if (data == null || data.isEmpty) {
                    return '*Please fill this field';
                  }

                  final DateTime inputDate;
                  try {
                    inputDate = DateFormat('yyyy-MM-dd').parse(data);
                  } catch (e) {
                    return '*Invalid date format';
                  }

                  if (inputDate.isBefore(DateTime.now())) {
                    return 'Date error, Try another date';
                  }

                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Date',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  hintText: 'YYYY-MM-DD',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Color(0xffF5903F),
                    ),
                  ),
                ),
                readOnly: true,
                onTap: () {
                  _selectDate();
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.datetime,
                textAlign: TextAlign.center,
                controller: fromTime,
                validator: (data) {
                  if (data == null || data.isEmpty) {
                    return '*Please fill this field';
                  }

                  final DateTime inputTime;
                  try {
                    inputTime = DateFormat('HH:mm').parse(data);
                  } catch (e) {
                    return '*Invalid time format';
                  }

                  final DateTime startTime = DateFormat('HH:mm').parse('09:00');
                  final DateTime endTime = DateFormat('HH:mm').parse('20:00');

                  if (inputTime.isBefore(startTime) || inputTime.isAfter(endTime)) {
                    return '*Time must be between 09:00 and 20:00';
                  }

                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'From',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  hintText: 'HH:MM',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
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
                  if (data == null || data.isEmpty) {
                    return '*Please fill this field';
                  }

                  final DateTime toInputTime;
                  final DateTime fromInputTime;
                  try {
                    toInputTime = DateFormat('HH:mm').parse(data);
                    fromInputTime = DateFormat('HH:mm').parse(fromTime.text);
                  } catch (e) {
                    return '*Invalid time format';
                  }

                  final DateTime startTime = DateFormat('HH:mm').parse('10:00');
                  final DateTime endTime = DateFormat('HH:mm').parse('21:00');

                  if (toInputTime.isBefore(startTime) || toInputTime.isAfter(endTime)) {
                    return '*Time must be between 10:00 and 21:00';
                  } else if (toInputTime.isBefore(fromInputTime)) {
                    return '*Timing error, try another time';
                  } else if (toInputTime.difference(fromInputTime).inMinutes < 60) {
                    return '*Your time is less than one hour, try another time';
                  }

                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'To',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  hintText: 'HH:MM',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const creditCard()));
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
