import 'package:fileexplorer/screens/creation_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xfff7f8f9),
        toggleableActiveColor: const Color(0xff06BD46),
        dividerTheme: DividerThemeData(
          color: Theme.of(context).canvasColor,
          thickness: .13,
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          headline2: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          headline3: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
            color: Colors.white,
          ),
          headline4: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color(0xff69696F),
          ),
          headline5: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xff69696F),
          ),
          headline6: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xff69696F),
          ),
        ),
      ),
      home: CreationScreen(),
    );
  }
}
