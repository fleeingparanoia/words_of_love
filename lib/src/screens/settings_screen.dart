import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:words_of_love/src/components/crazy_app_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final prefs;

  void loadSharedPrefs() async {
    // Obtain shared preferences.
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    loadSharedPrefs();
    super.initState();
  }

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
