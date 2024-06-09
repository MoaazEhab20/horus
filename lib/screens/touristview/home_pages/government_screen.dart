import 'package:final_project/components/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_government_card.dart';

class GovernmentScreen extends StatefulWidget {
  const GovernmentScreen({super.key});

  @override
  State<GovernmentScreen> createState() => _GovernmentScreenState();
}

class _GovernmentScreenState extends State<GovernmentScreen> {
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
            iconSize: 32,
            icon: const Icon(Icons.arrow_circle_left_outlined),
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: TextForTitleL(data: 'Choose City'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 21,
              crossAxisSpacing: 21,
              childAspectRatio: 0.74,
            ),
            itemBuilder: (contest, index) {
              return const CustomGovernmentCard();
            }),
      ),
    );
  }
}
