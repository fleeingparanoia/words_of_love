import 'package:flutter/material.dart';
import 'package:words_of_love/src/constants/const_values.dart';

class SearchBar extends StatelessWidget {
  final Function? onSearchChanged;
  final Function? onSearchTapped;
  SearchBar({this.onSearchChanged, this.onSearchTapped, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Search for a channel",
          filled: true,
          fillColor: Color(0xFFfaedcd),
          suffixIcon: const Icon(
            Icons.search,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged:
            onSearchChanged != null ? (value) => onSearchChanged!(value) : null,
        onSubmitted: (value) => onSearchTapped!(value),
      ),
    );
  }
}
