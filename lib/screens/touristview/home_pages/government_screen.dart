import 'package:final_project/components/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../models/government_model.dart';
import '../../../services/government_services.dart';
import '../../../widgets/custom_government_card.dart';

class GovernmentScreen extends StatefulWidget {
  const GovernmentScreen({super.key});

  @override
  State<GovernmentScreen> createState() => _GovernmentScreenState();
}

class _GovernmentScreenState extends State<GovernmentScreen> {
  Future<List<City>>? futureCities;

  @override
  void initState() {
    super.initState();
    futureCities = CityService().fetchCities();
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
            iconSize: 32,
            icon: const Icon(Icons.arrow_circle_left_outlined),
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: TextForTitleL(data: 'Choose City'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
        child: FutureBuilder<List<City>>(
          future: futureCities,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Color.fromARGB(221, 245, 145, 63),
              ));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No cities found'));
            } else {
              List<City> cities = snapshot.data!;
              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 21,
                  crossAxisSpacing: 21,
                  childAspectRatio: 0.74,
                ),
                itemCount: cities.length,
                itemBuilder: (context, index) {
                  return CustomGovernmentCard(city: cities[index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
