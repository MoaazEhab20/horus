import 'package:final_project/components/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../models/tourguide_model.dart';
import '../../../services/tourguide_choose_services.dart';
import '../../../widgets/custom_tourguide_card.dart';

class TourguideScreen extends StatefulWidget {
  const TourguideScreen({super.key});

  @override
  State<TourguideScreen> createState() => _TourguideScreenState();
}

class _TourguideScreenState extends State<TourguideScreen> {
  late Future<List<TourGuide>> _futureTourGuides;
  final TourGuideService _tourGuideService = TourGuideService();
  List<TourGuide> _tourGuides = [];
  List<TourGuide> _filteredTourGuides = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _futureTourGuides = _tourGuideService.fetchTourGuides();
    _futureTourGuides.then((tourGuides) {
      setState(() {
        _tourGuides = tourGuides;
        _filteredTourGuides = tourGuides;
      });
    });
  }

  void _filterTourGuides(String query) {
    setState(() {
      _searchQuery = query;
      _filteredTourGuides = _tourGuides.where((tourGuide) {
        return tourGuide.name.toLowerCase().contains(query.toLowerCase());
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
        title: TextForTitleL(data: 'Choose Tourguide'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: CustomSearchField(onChanged: _filterTourGuides),
            ),
            FutureBuilder<List<TourGuide>>(
              future: _futureTourGuides,
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
                    child: Center(child: Text('No tour guides available')),
                  );
                } else {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        TourGuide tourGuide = _filteredTourGuides[index];
                        return CustomTourguideCard(
                          tourGuide: tourGuide,
                        );
                      },
                      childCount: _filteredTourGuides.length,
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
