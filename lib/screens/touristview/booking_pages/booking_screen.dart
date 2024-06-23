import 'package:final_project/screens/touristview/booking_pages/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../components/custom_text.dart';
import '../../../cubit/reservation/reservation_cubit.dart';
import '../../../cubit/reservation/reservation_states.dart';
import '../../../models/landmark_model.dart';
import '../../../models/tourguide_model.dart';
import '../../../services/landmark_services.dart';

class BookingTourguide extends StatefulWidget {
  final TourGuide tourGuide;

  const BookingTourguide({super.key, required this.tourGuide});

  @override
  State<BookingTourguide> createState() => _BookingTourguideState();
}

class _BookingTourguideState extends State<BookingTourguide> {
  late Future<List<Landmark>> _futureLandmarks;
  final LandmarkService _landmarkService = LandmarkService();

  @override
  void initState() {
    super.initState();
    _futureLandmarks = _landmarkService.fetchLandmarkData();
  }

  TextEditingController fromTime = TextEditingController();
  TextEditingController toTime = TextEditingController();
  TextEditingController date = TextEditingController();
  String dayOfWeekChoosen = '';
  Landmark? landmarkChoice; // Changed type to Landmark
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
        date.text = DateFormat('yyyy-MM-dd').format(_picked);
      });
      dayOfWeekChoosen = DateFormat('EEEE').format(_picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReservationCubit(),
      child: BlocConsumer<ReservationCubit, ReservationStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
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
            title: TextForTitleL(data: 'Booking'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Spacer(flex: 1),
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
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
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
                  FutureBuilder<List<Landmark>>(
                    future: _futureLandmarks,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: CircularProgressIndicator(
                          color: Color(0xffF5903F),
                        ));
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text('No landmarks available'));
                      } else {
                        List<Landmark> landmarks = snapshot.data!
                            .where((landmark) => landmark.needTourguide == 1)
                            .toList();
                        return DropdownButtonFormField<Landmark>(
                          dropdownColor: Theme.of(context).primaryColorLight,
                          decoration: InputDecoration(
                            labelText: 'landmark',
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(196, 196, 196, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(245, 144, 63, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          isExpanded: true,
                          value: landmarkChoice,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          //style: const TextStyle(color: Colors.black),
                          onChanged: (Landmark? newValue) {
                            setState(() {
                              landmarkChoice = newValue;
                            });
                          },
                          items: landmarks.map<DropdownMenuItem<Landmark>>(
                              (Landmark landmark) {
                            return DropdownMenuItem<Landmark>(
                              value: landmark,
                              child: Text(landmark.name),
                            );
                          }).toList(),
                          validator: (value) {
                            if (value == null) {
                              return '*Please select a landmark';
                            }
                            return null;
                          },
                        );
                      }
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

                      DateTime startTime =
                          DateFormat('HH:mm').parse(landmarkChoice!.mondayOpen);
                      DateTime endTime = DateFormat('HH:mm')
                          .parse(landmarkChoice!.mondayClose);

                      if (dayOfWeekChoosen == 'Tuesday') {
                        startTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.tuesdayOpen);
                        endTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.tuesdayClose);
                      } else if (dayOfWeekChoosen == "Wednesday") {
                        startTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.wednesdayOpen);
                        endTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.wednesdayClose);
                      } else if (dayOfWeekChoosen == "Thursday") {
                        startTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.thursdayOpen);
                        endTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.thursdayClose);
                      } else if (dayOfWeekChoosen == "Friday") {
                        startTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.fridayOpen);
                        endTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.fridayClose);
                      } else if (dayOfWeekChoosen == "Saturday") {
                        startTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.saturdayOpen);
                        endTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.saturdayClose);
                      } else if (dayOfWeekChoosen == "Sunday") {
                        startTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.sundayOpen);
                        endTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.sundayClose);
                      }

                      String startTimeFormatted =
                          DateFormat('HH:mm').format(startTime);
                      String endTimeFormatted =
                          DateFormat('HH:mm').format(endTime);

                      if (inputTime.isBefore(startTime) ||
                          inputTime.isAfter(endTime)) {
                        return '*Time must be between ${startTimeFormatted} and ${endTimeFormatted}';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'From',
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
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
                        fromInputTime =
                            DateFormat('HH:mm').parse(fromTime.text);
                      } catch (e) {
                        return '*Invalid time format';
                      }

                      DateTime startTime =
                          DateFormat('HH:mm').parse(landmarkChoice!.mondayOpen);
                      DateTime endTime = DateFormat('HH:mm')
                          .parse(landmarkChoice!.mondayClose);

                      if (dayOfWeekChoosen == 'Tuesday') {
                        startTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.tuesdayOpen);
                        endTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.tuesdayClose);
                      } else if (dayOfWeekChoosen == "Wednesday") {
                        startTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.wednesdayOpen);
                        endTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.wednesdayClose);
                      } else if (dayOfWeekChoosen == "Thursday") {
                        startTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.thursdayOpen);
                        endTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.thursdayClose);
                      } else if (dayOfWeekChoosen == "Friday") {
                        startTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.fridayOpen);
                        endTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.fridayClose);
                      } else if (dayOfWeekChoosen == "Saturday") {
                        startTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.saturdayOpen);
                        endTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.saturdayClose);
                      } else if (dayOfWeekChoosen == "Sunday") {
                        startTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.sundayOpen);
                        endTime = DateFormat('HH:mm')
                            .parse(landmarkChoice!.sundayClose);
                      }

                      String startTimeFormatted =
                          DateFormat('HH:mm').format(startTime);
                      String endTimeFormatted =
                          DateFormat('HH:mm').format(endTime);

                      if (toInputTime.isBefore(startTime) ||
                          toInputTime.isAfter(endTime)) {
                        return '*Time must be between ${startTimeFormatted} and ${endTimeFormatted}';
                      } else if (toInputTime.isBefore(fromInputTime)) {
                        return '*Timing error, try another time';
                      } else if (toInputTime
                              .difference(fromInputTime)
                              .inMinutes <
                          60) {
                        return '*Your time is less than one hour, try another time';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'To',
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
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
                  Spacer(flex: 1),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final DateTime toInputTime =
                              DateFormat('HH:mm').parse(toTime.text);
                          final DateTime fromInputTime =
                              DateFormat('HH:mm').parse(fromTime.text);
                          print(widget.tourGuide.id);
                          print(landmarkChoice!.id);
                          print(toInputTime.difference(fromInputTime).inHours);
                          print(fromTime.text.toString());
                          print(toTime.text.toString());
                          print(date.text.toString());
                          ReservationCubit.get(context).createReservations(
                              tourist_id: '5',
                              tourguide_id: '${widget.tourGuide.id}',
                              landmark_id: '${landmarkChoice!.id}',
                              hours:
                                  '${toInputTime.difference(fromInputTime).inHours}',
                              starting_time: fromTime.text.toString(),
                              finished_time: toTime.text.toString(),
                              day: date.text.toString());
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  CustomCreditCard(id: '${3}',)));
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
                  Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
