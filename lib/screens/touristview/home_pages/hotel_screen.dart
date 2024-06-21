import 'package:final_project/components/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../models/hotel_model.dart';
import '../../../services/hotel_services.dart';
import '../../../widgets/custom_hotels_card.dart';
import '../../../widgets/custom_search_field.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({super.key});

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  late Future<List<Hotel>> _futureHotels;
  final HotelService _hotelService = HotelService();

  @override
  void initState() {
    super.initState();
    _futureHotels = _hotelService.fetchHotels();
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
        title: TextForTitleL(data: 'Choose Hotels'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: CustomSearchField(),
            ),
            FutureBuilder<List<Hotel>>(
              future: _futureHotels,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SliverToBoxAdapter(
                      child: Center(
                          child: CircularProgressIndicator(
                    color: Color.fromARGB(221, 245, 145, 63),
                  )));
                } else if (snapshot.hasError) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text('Error: ${snapshot.error}')),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(child: Text('No hotels available')),
                  );
                } else {
                  List<Hotel> hotels = snapshot.data!;
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        Hotel hotel = hotels[index];
                        return CustomHotelsCard(
                          hotel: hotel,
                        );
                      },
                      childCount: hotels.length,
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
