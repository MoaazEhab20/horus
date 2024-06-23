import 'package:final_project/cubit/reservation/reservation_cubit.dart';
import 'package:final_project/cubit/reservation/reservation_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/reservation_model.dart';

class CustomRequestCard extends StatelessWidget {
  final Reservation reservation;

  const CustomRequestCard({
    super.key, required this.reservation,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ReservationCubit(),
      child: BlocConsumer<ReservationCubit,ReservationStates>(
        listener: (context, state) {}, 
        builder: (context, state) => 
         GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
                Positioned(
                  left:13 ,
                  top: 8,
                  child: Text(
                          reservation.tourist.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 19,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600),
                        ),
                ),
                Positioned(
                  left: 13,
                  top: 36,
                  child: Container(
                    height: size.height*0.12,
                    width: size.width*0.26,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(29),
                          topRight: Radius.circular(29),
                          bottomLeft: Radius.circular(29),
                          bottomRight: Radius.circular(29),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/Dave-Dickinson-Headshot.jpg'),
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
                Positioned(
                  left: 128,
                  top: 38,
                  right: 13,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            Text(
                              'Day : ',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Theme.of(context).canvasColor,
                                  fontSize: 19,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '${reservation.day.day}-${reservation.day.month}-${reservation.day.year}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Time : ',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Theme.of(context).canvasColor,
                                fontSize: 19,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${reservation.startingTime.substring(0,5)} : ${reservation.finishedTime.substring(0,5)}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0,left: 36),
                        child: Text(
                          reservation.landmark.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Theme.of(context).canvasColor,
                              fontSize: 19,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 13,
                  right: 13,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          print(reservation.id);
                          print(1);
                          ReservationCubit.get(context).approvedReservations(reservation_id: '${reservation.id}', isAccepted: '${1}');
                        },
                        color: Theme.of(context).primaryColorLight,
                        minWidth: size.width * 0.35,
                        height: 45,
                        elevation: 0.5,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0), // Change your border radius here
                          ),
                        ),
        
                        //shape: ,
                        child: const Text(
                          'Accept',
                          style: TextStyle(
                              fontSize: 19,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              color: Color(0xff00A6A6)),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          print(reservation.id);
                          print(0);
                          ReservationCubit.get(context).approvedReservations(reservation_id: '${reservation.id}', isAccepted: '${0}');
                        },
                        color: Theme.of(context).primaryColorLight,
                        minWidth: size.width * 0.35,
                        height: 45,
                        elevation: 0.5,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0), // Change your border radius here
                          ),
                        ),
                        child: const Text(
                          'Reject',
                          style: TextStyle(
                              fontSize: 19,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFF0000)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}