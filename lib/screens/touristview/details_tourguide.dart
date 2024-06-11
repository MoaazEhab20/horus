import 'package:flutter/material.dart';

class detailsTourguide extends StatelessWidget {
  const detailsTourguide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            SizedBox(height: 60,),
            ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: Stack(
              children: [
                Stack(
                  children: [
                    Image.asset('assets/images/camal.jpg'),
                    IconButton(
                      iconSize: 30,
                      icon: Icon(
                        Icons.arrow_back,
                        color: Color(0xffF5903F),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            )),
            SizedBox(height: 40,),
            Row(
              children: [
                Text('Name :',style: TextStyle(fontSize: 24,fontFamily: 'inter'),),
                Spacer(flex: 1,),
                Text('Mohamed',style: TextStyle(fontSize: 24,fontFamily: 'inter'),),
                Spacer(flex: 2,),
              ],
            ),
            SizedBox(height: 9,),
            Row(
              children: [
                Text('AGE :',style: TextStyle(fontSize: 24,fontFamily: 'inter'),),
                Spacer(flex: 1,),
                Text('22',style: TextStyle(fontSize: 24,fontFamily: 'inter'),),
                Spacer(flex: 2,),
              ],
            ),
            SizedBox(height: 9,),
            Row(
              children: [
                Text('Languages :',style: TextStyle(fontSize: 24,fontFamily: 'inter'),),
                Spacer(flex: 1,),
                Text('arabic , english',style: TextStyle(fontSize: 24,fontFamily: 'inter'),),
                Spacer(flex: 2,),
              ],
            ),
            SizedBox(height: 9,),
            Row(
              children: [
                Text('price / per hour :',style: TextStyle(fontSize: 24,fontFamily: 'inter'),),
                Spacer(flex: 1,),
                Text('35',style: TextStyle(fontSize: 24,fontFamily: 'inter'),),
                Spacer(flex: 2,),
              ],
            ),
            SizedBox(height: 140,),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5903F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0.0,
                          shadowColor: Theme.of(context).primaryColorLight,
                        ),
                        onPressed: () {
                          
                        },
                        child: Row(
                          children: [
                            Spacer(flex: 1,),
                            Text(
                              'Book',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}