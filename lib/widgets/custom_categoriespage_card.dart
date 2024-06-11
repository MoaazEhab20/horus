import 'package:final_project/screens/touristview/details_screen.dart';
import 'package:flutter/material.dart';

class CustomCategoriesPageCard extends StatelessWidget {
  const CustomCategoriesPageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => detailsScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
                color: Theme.of(context).primaryColorLight,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 175,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(29),
                          topRight: Radius.circular(29)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/cairo.jpg'),
                        fit: BoxFit.fill,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 12),
                  child: Text(
                    'Cairo Tower',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
