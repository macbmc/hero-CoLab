import 'package:flutter/material.dart';

class SettP extends StatefulWidget {
  const SettP({Key? key}) : super(key: key);

  @override
  State<SettP> createState() => _SettPState();
}

class _SettPState extends State<SettP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings and Alert"),
      ),
    );
  }
}
