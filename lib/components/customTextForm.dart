import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  const CustomForm(
      {required this.hint,
      super.key,
      required this.controller,
      this.fun,
      this.type,
      this.icon,
      this.secure});

  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? fun;
  final TextInputType? type;
  final Icon? icon;
  final bool? secure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      validator: fun ??
          (value) {
            if (controller.text.isEmpty) {
              return 'Field Mustn`t Be Empty';
            }
            return null;
          },
      obscureText: secure ?? false,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(196, 196, 196, 1.0), width: 1),
            borderRadius: BorderRadius.circular(50)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(50)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(245, 144, 63, 1.0), width: 1),
            borderRadius: BorderRadius.circular(50)),
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0XFFD8D8D8)),
      ),
    );
  }
}
