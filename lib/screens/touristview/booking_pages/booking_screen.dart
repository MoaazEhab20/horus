import 'package:flutter/material.dart';

import '../../../components/custom_text.dart';

class bookingTourguide extends StatefulWidget {
  const bookingTourguide({super.key});

  @override
  State<bookingTourguide> createState() => _bookingTourguideState();
}

class _bookingTourguideState extends State<bookingTourguide> {
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
        child: Column(
          children: <Widget>[
            Spacer(flex: 1,),
            TextField(
              textAlign: TextAlign.center,
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
            TextField(
              textAlign: TextAlign.center,
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
            TextField(
              textAlign: TextAlign.center,
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
    );
  }
}