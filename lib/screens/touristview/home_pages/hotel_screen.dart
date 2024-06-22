import 'package:final_project/components/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../models/hotel_model.dart';
import '../../../services/hotel_services.dart';
import '../../../widgets/custom_hotels_card.dart';

//import '../../../widgets/custom_search_field.dart';
class HotelsScreen extends StatefulWidget {
  const HotelsScreen({super.key});

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  late Future<List<Hotel>> _futureHotels;
  final HotelService _hotelService = HotelService();
  List<Hotel> _hotels = [];
  List<Hotel> _filteredHotels = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _futureHotels = _hotelService.fetchHotels();
    _futureHotels.then((hotels) {
      setState(() {
        _hotels = hotels;
        _filteredHotels = hotels;
      });
    });
  }

  void _filterHotels(String query) {
    setState(() {
      _searchQuery = query;
      _filteredHotels = _hotels.where((hotel) {
        return hotel.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
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
            SliverToBoxAdapter(
              child: CustomSearchField(onChanged: _filterHotels),
            ),
            FutureBuilder<List<Hotel>>(
              future: _futureHotels,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Color.fromARGB(221, 245, 145, 63),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text('Error: ${snapshot.error}')),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(child: Text('No hotels available')),
                  );
                } else {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        Hotel hotel = _filteredHotels[index];
                        return CustomHotelsCard(
                          hotel: hotel,
                        );
                      },
                      childCount: _filteredHotels.length,
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

class CustomSearchField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const CustomSearchField({
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.black),
      onChanged: onChanged,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Color(0xffF6F5FB),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5),
          child: Icon(
            Icons.search_rounded,
            color: Color(0xffC7C7C7),
            size: 32,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(28)),
            borderSide: const BorderSide(
              width: 1,
              color: Color(0XFFF5903F),
            )),
        hintText: 'Search now',
        hintStyle: TextStyle(
          color: Color(0xffC7C7C7),
          fontSize: 16,
          fontFamily: 'Inter',
        ),
      ),
    );
  }
}
