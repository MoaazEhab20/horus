import 'package:flutter/material.dart';

class DropdownTextField extends StatefulWidget {
  @override
  _DropdownTextFieldState createState() => _DropdownTextFieldState();
}

class _DropdownTextFieldState extends State<DropdownTextField> {
  String? _selectedItem;
  List<String> _dropdownItems = ['English', 'Arabic', 'Deutsch'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 339, 
      height: 59,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0XFFD8D8D8)),
        borderRadius: BorderRadius.circular(50.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedItem,
          hint: Text('Add Language',style: TextStyle(color: Color(0XFFD8D8D8)),), 
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.black),
          onChanged: (String? newValue){setState(() {
            _selectedItem = newValue!;
          });},
          items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}