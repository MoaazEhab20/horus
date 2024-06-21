import 'package:final_project/components/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../models/landmark_model.dart';
import '../../../services/entertiment_services.dart';
import '../../../widgets/custom_entertiment_card.dart';
import '../../../widgets/custom_search_field.dart';

class EntertainmentScreen extends StatefulWidget {
  const EntertainmentScreen({super.key});

  @override
  State<EntertainmentScreen> createState() => _EntertainmentScreenState();
}

class _EntertainmentScreenState extends State<EntertainmentScreen> {
  late Future<List<Landmark>> _futureLandmark;
  final EntertimentService _EntertimentService = EntertimentService();
  @override
  void initState() {
    super.initState();
    _futureLandmark = _EntertimentService.fetchEntertimentData();
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
        title: TextForTitleL(
          data: 'Choose Entertainment',
        ),
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
              List<Landmark> entertiments = snapshot.data!;
              return CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: CustomSearchField(),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.all(0.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          Landmark entertiment = entertiments[index];
                          return CustomEntertimentCard(
                            entertiment: entertiment,
                          );
                        },
                        childCount: entertiments.length,
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
