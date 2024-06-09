import 'package:final_project/theme/dark_mode_switch.dart';
import 'package:flutter/material.dart';

class TourguideSettingScreen extends StatefulWidget {
  const TourguideSettingScreen({super.key});

  @override
  State<TourguideSettingScreen> createState() => _SettingState();
}

class _SettingState extends State<TourguideSettingScreen> {
  bool isSwitched = false;

  String _dropdownValue = 'English';

  var _items = ['English', 'Arabic'];

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
            icon: Icon(
              Icons.arrow_circle_left_outlined,
              color: Color(0xff253544),
              size: 32,
            ),
          ),
        ),
        title: Text('settings', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Dark Mode',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff253544),
                      fontFamily: 'Inter'),
                ),
                const SizedBox(
                  width: 150,
                ),
                DarkModeSwitch(),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  'Language',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff253544),
                      fontFamily: 'Inter'),
                ),
                const SizedBox(
                  width: 120,
                ),
                Container(
                  //width: 34,
                  //height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: DropdownButton(
                    items: _items.map((String item) {
                      return DropdownMenuItem(value: item, child: Text(item));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _dropdownValue = newValue!;
                      });
                    },
                    value: _dropdownValue,
                    //borderRadius: BorderRadius.circular(24),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff253544),
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
