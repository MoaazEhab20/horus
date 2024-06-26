import 'package:flutter/material.dart';
import '../../models/reservation_model.dart';
import '../../services/reservation_services.dart';
import '../../widgets/custom_request_card.dart';

class TourguideHomeScreen extends StatefulWidget {
  const TourguideHomeScreen({super.key});

  @override
  State<TourguideHomeScreen> createState() => _TourguideHomeScreenState();
}

class _TourguideHomeScreenState extends State<TourguideHomeScreen> {
  late Future<List<Reservation>> _futureReservations;
  final ReservationService _reservationService = ReservationService();

  @override
  void initState() {
    super.initState();
    _futureReservations = _reservationService.fetchReservations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CircleAvatar(
                radius: 26,
                backgroundImage:
                    AssetImage('assets/images/Dave-Dickinson-Headshot.jpg'),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome Back 👋🏻',
                  style: TextStyle(
                    color: Color(0xffA4A4A4),
                    fontSize: 18,
                    fontFamily: 'Inter',
                  ),
                ),
                Text(
                  'Moaaz Ehab',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 195,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/cairo.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                      ),
                      Positioned(
                        top: 135,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(221, 245, 145, 63),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 4, top: 4),
                                    child: Icon(
                                      Icons.location_on_sharp,
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      size: 22,
                                    ),
                                  ),
                                  Text(
                                    'Cairo , Egypt',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 14.0),
                                child: Text(
                                  'Current City',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorLight,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Requests',
                      style: TextStyle(
                        //color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Reservation>>(
              future: _futureReservations,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (snapshot.hasError) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text('Error: ${snapshot.error}')),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(child: Text('No reservations available')),
                  );
                } else {
                  List<Reservation> reservations = snapshot.data!;
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        Reservation reservation = reservations[index];
                        return CustomRequestCard(
                          reservation: reservation,
                        );
                      },
                      childCount: reservations.length,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}