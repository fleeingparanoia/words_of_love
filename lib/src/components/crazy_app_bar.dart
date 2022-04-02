import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:words_of_love/src/components/search_bar.dart';
import 'package:words_of_love/src/constants/const_values.dart';
import 'package:words_of_love/src/screens/settings_screen.dart';

class CrazyAppbar extends StatelessWidget {
  final String title;
  final bool _showSettings;
  final bool _showSearch;

  final Function? onSearchChanged;
  final Function? onSearchTapped;

  const CrazyAppbar({
    required this.title,
    Key? key,
  })  : _showSettings = true,
        _showSearch = false,
        onSearchChanged = null,
        onSearchTapped = null,
        super(key: key);

  const CrazyAppbar.hideSettings({
    required this.title,
    Key? key,
  })  : _showSettings = false,
        _showSearch = false,
        onSearchChanged = null,
        onSearchTapped = null,
        super(key: key);

  const CrazyAppbar.withSearch({
    required this.title,
    this.onSearchChanged,
    this.onSearchTapped,
    Key? key,
  })  : _showSettings = true,
        _showSearch = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      title: Text(title),
      bottom: _showSearch
          ? PreferredSize(
              child: SearchBar(
                onSearchChanged: onSearchChanged,
                onSearchTapped: onSearchTapped,
              ),
              preferredSize: const Size.fromHeight(100),
            )
          : null,
      actions: _showSettings
          ? [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.settings,
                ),
              ),
            ]
          : [],
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      foregroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
