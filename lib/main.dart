import 'package:fileexplorer/providers/base_provider.dart';
import 'package:fileexplorer/screens/creation_screen.dart';
import 'package:fileexplorer/screens/creation_screen_zero.dart';
import 'package:fileexplorer/screens/main_screen.dart';
import 'package:fileexplorer/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'widgets/floating_bottom_bar.dart';

void main() {
  CustomImageCache();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BaseProvider()),
      ],
      child: MyApp(),
    ),
  );
}


class CustomImageCache extends WidgetsFlutterBinding {
  @override
  ImageCache createImageCache() {
    ImageCache imageCache = super.createImageCache();
    // Set your image cache size
    imageCache.maximumSizeBytes = 1024 * 1024 * 512; // 100 MB
    return imageCache;
  }
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
        scaffoldBackgroundColor: Colors.white,
        toggleableActiveColor: const Color(0xff06BD46),
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: Colors.white,
          iconTheme: IconThemeData(
            color: const Color(0xff293B63),
          ),
          actionsIconTheme: IconThemeData(
            color: const Color(0xff293B63),
          ),
          elevation: 0,
        ),
        iconTheme: IconThemeData(color: const Color(0xff293B63)),
        dividerTheme: DividerThemeData(
          color: Theme.of(context).canvasColor,
          thickness: .13,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Splash(),
    );
  }
}
