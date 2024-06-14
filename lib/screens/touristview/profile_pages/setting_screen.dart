import 'package:final_project/components/custom_text.dart';
import 'package:final_project/theme/dark_mode_switch.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingState();
}

class _SettingState extends State<SettingScreen> {
  bool isSwitched = false;

  String _dropdownValue = 'English';

  final _items = ['English', 'Arabic'];

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
              color: Theme.of(context).primaryColor,
              size: 32,
            ),
          ),
        ),
        title: TextForTitleL(data: 'settings'),
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
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Inter'),
                ),
                Spacer(flex: 1,),
                DarkModeSwitch(),
                /*Switch(
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.black,
                  inactiveTrackColor: Colors.black,
                  value: isSwitched,
                 onChanged: (value){
                  setState(() {
                    isSwitched = value;
                  });
                 }
                 ),*/
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
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Inter'),
                ),
                Spacer(flex: 1,),
                Container(
                  //width: 34,
                  //height: 32,
                  decoration: const BoxDecoration(
                      // color: Colors.white,
                      ),
                  child: DropdownButton(
                    dropdownColor: Colors.transparent,
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
                      color: Theme.of(context).primaryColor,
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
