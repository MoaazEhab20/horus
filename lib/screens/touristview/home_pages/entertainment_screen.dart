import 'package:final_project/components/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_categoriespage_card.dart';
import '../../../widgets/custom_search_field.dart';

class EntertainmentScreen extends StatefulWidget {
  const EntertainmentScreen({super.key});

  @override
  State<EntertainmentScreen> createState() => _EntertainmentScreenState();
}

class _EntertainmentScreenState extends State<EntertainmentScreen> {
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
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: CustomSearchField(),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(childCount: 10,
                    (context, index) {
              return const CustomCategoriesPageCard();
            }))
          ],
        ),
      ),
    );
  }
}
