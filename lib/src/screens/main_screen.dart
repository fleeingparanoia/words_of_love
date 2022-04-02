import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:words_of_love/src/services/invidious_api_helper.dart';
import 'package:words_of_love/src/views/channels_view.dart';
import 'package:words_of_love/src/views/home_view.dart';
import 'package:words_of_love/src/views/saved_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedPage = 0;
  final _pageOptions = [
    HomePage(),
    SavedPage(),
    ChannelsPage(),
  ];

  @override
  void initState() {
    InvidiousApiHelper.instance.init();
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: "Saved",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Channels",
            ),
          ],
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: selectedPage,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ));
  }
}
