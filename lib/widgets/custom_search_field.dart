import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffF6F5FB),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5),
          child: Icon(
            Icons.search_rounded,
            color: Color(0xffC7C7C7),
            size: 32,
          ),
        ),
        hintText: 'Search now',
        hintStyle: TextStyle(
          color: Color(0xffC7C7C7),
          fontSize: 16,
          fontFamily: 'Inter',
        ),
      ),
    );
  }
}
