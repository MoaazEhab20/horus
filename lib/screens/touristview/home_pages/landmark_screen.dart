//import 'package:final_project/components/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_text.dart';
import '../../../models/landmark_model.dart';
import '../../../services/landmark_services.dart';
import '../../../widgets/custom_landmark_card.dart';
//import '../../../widgets/custom_search_field.dart';

class LandmarkScreen extends StatefulWidget {
  const LandmarkScreen({super.key});

  @override
  State<LandmarkScreen> createState() => _LandmarkScreenState();
}

class _LandmarkScreenState extends State<LandmarkScreen> {
  late Future<List<Landmark>> _futureLandmark;
  final LandmarkService _LandmarkService = LandmarkService();
  List<Landmark> _landmarks = [];
  List<Landmark> _filteredLandmarks = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _futureLandmark = _LandmarkService.fetchLandmarkData();
    _futureLandmark.then((landmarks) {
      setState(() {
        _landmarks = landmarks;
        _filteredLandmarks = landmarks;
      });
    });
  }

  void _filterLandmarks(String query) {
    setState(() {
      _searchQuery = query;
      _filteredLandmarks = _landmarks.where((landmark) {
        return landmark.name.toLowerCase().contains(query.toLowerCase());
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
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No landmarks available'));
            } else {
              return CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: CustomSearchField(onChanged: _filterLandmarks),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.all(2.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          Landmark landmark = _filteredLandmarks[index];
                          return CustomLandmarkCard(landmark: landmark);
                        },
                        childCount: _filteredLandmarks.length,
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
