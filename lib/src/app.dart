import 'package:flutter/material.dart';
import "package:words_of_love/src/screens/main_screen.dart";

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Words of love',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFfefae0),
        primaryColor: Color(0xFFd4a373),
        colorScheme: ColorScheme.light().copyWith(
          secondary: Color(0xFFccd5ae),
        ),
        fontFamily: "Nunito",
      ),
      home: const MainScreen(),
    );
  }
}
