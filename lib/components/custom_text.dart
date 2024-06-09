// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextForTitleL extends StatelessWidget {
  String? data;
  TextForTitleL({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(
      data!,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}

class TextForTitleM extends StatelessWidget {
  String? data;
  TextForTitleM({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(
      data!,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

class TextForBodyL extends StatelessWidget {
  String? data;
  TextForBodyL({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(
      data!,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

class TextForBodyM extends StatelessWidget {
  String? data;
  TextForBodyM({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(
      data!,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

class CustomText extends StatelessWidget {
  String? data;
  double? size = 20;
  Color? color = Color(0xff253544);
  CustomText({@required this.data, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      data!,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Inter',
      ),
    );
  }
}
