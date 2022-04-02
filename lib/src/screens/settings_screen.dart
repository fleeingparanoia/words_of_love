import 'package:flutter/material.dart';
import 'package:words_of_love/src/components/crazy_app_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          CrazyAppbar.hideSettings(title: "Settings"),
        ],
      ),
    );
  }
}
