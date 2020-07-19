import 'package:fileexplorer/providers/base_provider.dart';
import 'package:fileexplorer/screens/image_category_screen.dart';
import 'package:fileexplorer/screens/main_screen.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:root_access/root_access.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  bool _rootAccess = false;

  startTimeout() {
    return Timer(Duration(seconds: 2), handleTimeout);
  }

  void handleTimeout() {
    changeScreen();
  }

  changeScreen() async {

    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    PermissionStatus permission = await Permission.storage.status;

    if (permission != PermissionStatus.granted) {
      Permission.storage.status
          .then((v) {})
          .then((v) async {
        PermissionStatus permission1 = await Permission.storage.status;
        if (permission1 == PermissionStatus.granted) {
          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: MainScreen(),
            ),
          );
          Timer(Duration(seconds: 1), () {
            Provider.of<BaseProvider>(context, listen: false).initializeBlaze();
          });
        }
      });
    } else {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: MainScreen(),
        ),
      );
      Provider.of<BaseProvider>(context, listen: false).initializeBlaze();
    }
  }



  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
//        mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Feather.folder,
              color: Theme.of(context).accentColor,
              size: 70,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "File Explorer",
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
