import 'package:final_project/components/custom_text.dart';
import 'package:flutter/material.dart';

import '../models/categories_model.dart';

class CustomCategoriesCard extends StatelessWidget {
  const CustomCategoriesCard({super.key, required this.categories});
  final CategoriesModel categories;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(categories.navigat);
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Container(
              color: Colors.transparent,
              height: 95,
              width: 72,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 72, // Adjust this according to your needs
                height: 72, // Adjust this according to your needs
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context)
                      .primaryColorLight, // Optional: background color of the circle
                ),
                child: ClipOval(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      categories.image, // Replace with your image URL
                      fit: BoxFit.contain,
                      width: 60, // Adjust this according to your needs
                      height: 60, // Adjust this according to your needs
                    ),
                  ),
                ),
              ),
              /*Container(
                height: 72,
                width: 72,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xffF6F5FB),
                    image: DecorationImage(
                        image: AssetImage(categories.image),
                        alignment: Alignment.center,
                        fit: BoxFit.fill)),
              ),
               CircleAvatar(
                radius: 36,
                backgroundColor: const Color(0xffF6F5FB),
                backgroundImage: AssetImage(categories.image),
              ),*/
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: TextForBodyM(
                  data: categories.categorieType,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
