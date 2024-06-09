import 'package:flutter/material.dart';

class TourguideChatScreen extends StatefulWidget {
  const TourguideChatScreen({super.key});

  @override
  State<TourguideChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<TourguideChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Chat', style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
      ),
      body: ListView(),
    );
  }
}
