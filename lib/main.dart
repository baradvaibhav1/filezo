import 'package:fileexplorer/screens/creation_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: CreationScreen(),
    );
  }
}
