import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../models/government_model.dart';


class CustomGovernmentCard extends StatelessWidget {
  final City city;
  final int indexC;

  const CustomGovernmentCard({
    Key? key,
    required this.city,
    required this.indexC,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        indexCity = indexC + 1;
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('indexCity', indexCity);
        Navigator.pop(context);
        //return CustomGovernmentChooseCard();
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              image: DecorationImage(
                image: NetworkImage(city.cityImg),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: 60,
              decoration: const BoxDecoration(
                color: Color.fromARGB(221, 245, 145, 63),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Center(
                child: Text(
                  city.cityName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
