import 'package:fileexplorer/fragments/favorites_fragment.dart';
import 'package:fileexplorer/fragments/home_fragment.dart';
import 'package:fileexplorer/fragments/settings_fragment.dart';
import 'package:fileexplorer/fragments/trash_fragment.dart';
import 'package:fileexplorer/widgets/share_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  var _homeFragment, _favoritesFragment, _trashFragment, _settingsFragment;
  PageController _pageController = PageController(
    initialPage: 0,
    keepPage: false,
  );

  @override
  void initState() {
    this._currentIndex = 0;
    super.initState();
  }

  Widget homeFragment() {
    if (this._homeFragment == null) this._homeFragment = HomeFragment();
    return this._homeFragment;
  }

  Widget favoritesFragment() {
    if (this._favoritesFragment == null)
      this._favoritesFragment = FavoritesFragment();
    return this._favoritesFragment;
  }

  Widget trashFragment() {
    if (this._trashFragment == null) this._trashFragment = TrashFragment();
    return this._trashFragment;
  }

  Widget settingsFragment() {
    if (this._settingsFragment == null)
      this._settingsFragment = SettingsFragment();
    return this._settingsFragment;
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ShareButton(
        buttonSize: 64,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(FlutterIcons.home_faw),
                onPressed: () {},
                iconSize: 24,
              ),
              IconButton(
                icon: Icon(FlutterIcons.game_controller_ent),
                onPressed: () {},
                iconSize: 24,
              ),
              Visibility(
                visible: false,
                child: IconButton(
                  icon: Icon(FlutterIcons.folder_faw5),
                  onPressed: () {},
                  iconSize: 24,
                ),
              ),
              IconButton(
                icon: Icon(FlutterIcons.folder_faw5),
                onPressed: () {},
                iconSize: 24,
              ),
              IconButton(
                icon: Icon(FlutterIcons.settings_fea),
                onPressed: () {},
                iconSize: 24,
              ),
            ],
          ),
        ),
      ),
      body: PageView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) return this.homeFragment();
          if (index == 1) return this.favoritesFragment();
          if (index == 2) return this.trashFragment();
          if (index == 3) return this.settingsFragment();
          return null;
        },
        pageSnapping: true,
        controller: _pageController,
        onPageChanged: _onPageChanged,
      ),
    );
  }
}
