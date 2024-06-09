import 'package:flutter/material.dart';

class CustomFavouriteCard extends StatelessWidget {
  const CustomFavouriteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
            Positioned(
              top: 10,
              right: 13,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_outlined,
                    color: Color(0xffF5903F),
                    size: 40,
                    shadows: [
                      Shadow(
                          color: Color.fromARGB(25, 0, 0, 0),
                          offset: Offset(0, 4),
                          blurRadius: 0)
                    ],
                  )),
            ),
            Positioned(
              top: 10,
              left: 8,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.cancel_rounded,
                    color: Theme.of(context).primaryColorLight,
                    size: 35,
                    shadows: [
                      Shadow(
                          color: Color.fromARGB(25, 0, 0, 0),
                          offset: Offset(0, 4),
                          blurRadius: 0)
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
