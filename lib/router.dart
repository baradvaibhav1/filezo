import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:fileexplorer/screens/folder_screen.dart';
import 'package:fileexplorer/screens/image_category_screen.dart';
import 'package:fileexplorer/screens/main_screen.dart';
import 'package:fileexplorer/screens/splash_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: Splash, initial: true),
    MaterialRoute(path:"/home",page: MainScreen),
    CustomRoute(path:"/folder",page: FolderScreen,transitionsBuilder : TransitionsBuilders.slideLeftWithFade,  durationInMilliseconds: 200),
    CustomRoute(path:"/image_category",page: ImageCategoryScreen,transitionsBuilder : TransitionsBuilders.slideLeftWithFade,  durationInMilliseconds: 200),
  ],
)
class $Router {}
