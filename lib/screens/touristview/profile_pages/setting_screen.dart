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
              height: 50,
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
              ],
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
