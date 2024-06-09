import 'package:final_project/components/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_search_field.dart';
import '../../../widgets/custom_tourguide_card.dart';

class TourguideScreen extends StatefulWidget {
  const TourguideScreen({super.key});

  @override
  State<TourguideScreen> createState() => _TourguideScreenState();
}

class _TourguideScreenState extends State<TourguideScreen> {
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
            SliverList(
                delegate: SliverChildBuilderDelegate(childCount: 10,
                    (context, index) {
              return const CustomTourguideCard();
            }))
          ],
        ),
      ),
    );
  }
}
