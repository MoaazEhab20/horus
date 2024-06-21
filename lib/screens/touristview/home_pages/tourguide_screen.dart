import 'package:final_project/components/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../models/tourguide_model.dart';
import '../../../services/tourguide_choose_services.dart';
import '../../../widgets/custom_search_field.dart';
import '../../../widgets/custom_tourguide_card.dart';

class TourguideScreen extends StatefulWidget {
  const TourguideScreen({super.key});

  @override
  State<TourguideScreen> createState() => _TourguideScreenState();
}

class _TourguideScreenState extends State<TourguideScreen> {
  late Future<List<TourGuide>> _futureTourGuides;
  final TourGuideService _tourGuideService = TourGuideService();

  @override
  void initState() {
    super.initState();
    _futureTourGuides = _tourGuideService.fetchTourGuides();
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
            const SliverToBoxAdapter(
              child: CustomSearchField(),
            ),
            FutureBuilder<List<TourGuide>>(
              future: _futureTourGuides,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SliverToBoxAdapter(
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Color.fromARGB(221, 245, 145, 63),
                    )),
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
                  List<TourGuide> tourGuides = snapshot.data!;
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        TourGuide tourGuide = tourGuides[index];
                        return CustomTourguideCard(
                          tourGuide: tourGuide,
                        );
                      },
                      childCount: tourGuides.length,
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
