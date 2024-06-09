import 'package:flutter/material.dart';

class CustomGovernmentChooseCard extends StatelessWidget {
  const CustomGovernmentChooseCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Egyptian Museum.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(25))),
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
                    bottomRight: Radius.circular(25))),
            child: const Center(
              child: Text(
                'Cairo',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          left: 0,
          bottom: 0,
          child: Container(
            color: Colors.white.withOpacity(0.29),
          ),
        ),
        const Center(
          child: Icon(
            Icons.where_to_vote_outlined,
            color: Colors.green,
            size: 80,
          ),
        )
      ]),
    );
  }
}
