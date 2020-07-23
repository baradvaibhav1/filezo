// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'screens/folder_screen.dart';
import 'screens/image_category_screen.dart';
import 'screens/main_screen.dart';
import 'screens/splash_screen.dart';

class Routes {
  static const String splash = '/';
  static const String mainScreen = '/home';
  static const String folderScreen = '/folder';
  static const String imageCategoryScreen = '/image_category';
  static const all = <String>{
    splash,
    mainScreen,
    folderScreen,
    imageCategoryScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splash, page: Splash),
    RouteDef(Routes.mainScreen, page: MainScreen),
    RouteDef(Routes.folderScreen, page: FolderScreen),
    RouteDef(Routes.imageCategoryScreen, page: ImageCategoryScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Splash: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Splash(),
        settings: data,
      );
    },
    MainScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MainScreen(),
        settings: data,
      );
    },
    FolderScreen: (data) {
      var args = data.getArgs<FolderScreenArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            FolderScreen(path: args.path),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
      );
    },
    ImageCategoryScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ImageCategoryScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// FolderScreen arguments holder class
class FolderScreenArguments {
  final String path;
  FolderScreenArguments({@required this.path});
}
