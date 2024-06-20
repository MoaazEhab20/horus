//import 'package:final_project/components/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_text.dart';
import '../../../models/landmark_model.dart';
import '../../../services/landmark_services.dart';
import '../../../widgets/custom_landmark_card.dart';

class LandmarkScreen extends StatefulWidget {
  const LandmarkScreen({super.key});

  @override
  State<LandmarkScreen> createState() => _LandmarkScreenState();
}

class _LandmarkScreenState extends State<LandmarkScreen> {
  late Future<List<Landmark>> _futureLandmark;
  final LandmarkService _LandmarkService = LandmarkService();
  @override
  void initState() {
    super.initState();
    _futureLandmark = _LandmarkService.fetchLandmarkData();
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
        title: TextForTitleL(data: 'Choose Landmark'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: FutureBuilder<List<Landmark>>(
          future: _futureLandmark,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: Color.fromARGB(221, 245, 145, 63),
              ));
            } else if (snapshot.hasError) {
              return SliverToBoxAdapter(
                child: Center(child: Text('Error: ${snapshot.error}')),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const SliverToBoxAdapter(
                child: Center(child: Text('No landmarks available')),
              );
            } else {
              List<Landmark> landmarks = snapshot.data!;
              return CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverPadding(
                    padding: EdgeInsets.all(2.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          Landmark landmark = landmarks[index];
                          return CustomLandmarkCard(landmark: landmark);
                        },
                        childCount: landmarks.length,
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
