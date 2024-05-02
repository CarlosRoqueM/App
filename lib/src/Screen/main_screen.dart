import 'package:app/src/Screen/side_menu_list.dart';
import 'package:app/src/pages/favorite/favorite_page.dart';
import 'package:app/src/pages/home/home_page.dart';
import 'package:app/src/pages/profile/profile_page.dart';
import 'package:app/src/pages/settings/settings_page.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/utils/global_color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomePage(),
      FavoritePage(),
      ProfilePage(),
      SettingsPage(),
    ];

    return SideMenu(
      background: GlobalColors.fourthColor,
      key: sideMenuKey,
      menu: SideMenuList(),
      maxMenuWidth: 280,
      child: BackgroundTemplate(
        child: Scaffold(
          /*appBar: AppBar(
            //backgroundColor: Colors.transparent,
            backgroundColor: Color.fromRGBO(0, 0, 0, .15),
            elevation: 0.0,
            toolbarHeight: 40,
            leading: IconButton(
                splashColor: Colors.white,
                onPressed: () {
                  if (sideMenuKey.currentState!.isOpened) {
                    sideMenuKey.currentState!.closeSideMenu();
                  } else {
                    sideMenuKey.currentState!.openSideMenu();
                  }
                },
                iconSize: 25,
                color: GlobalColors.primaryColor,
                icon: Icon(Icons.menu)),
            title: Text(
              'Nurse hunt',
              style: TextStyle(
                  color: GlobalColors.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),*/
          body: IndexedStack(
            index: selectedIndex,
            children: screens,
          ),
          backgroundColor: Colors.transparent,
          /*bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            color: GlobalColors.primaryColor,
            animationDuration: Duration(milliseconds: 300),
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            items: [
              Icon(
                Icons.home,
                color: Colors.white,
              ),
              Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              Icon(
                Icons.person,
                color: Colors.white,
              ),
            ],
          ),*/
          bottomNavigationBar: FlashyTabBar(
            selectedIndex: selectedIndex,
            showElevation: true,
            onItemSelected: (index) => setState(() {
              selectedIndex = index;
            }),
            items: [
              FlashyTabBarItem(
                  icon: Icon(Icons.home_filled),
                  title: Text('Home'),
                  activeColor: GlobalColors.primaryColor,
                  inactiveColor: GlobalColors.fifthColor),
              FlashyTabBarItem(
                  icon: Icon(Icons.favorite),
                  title: Text('Search'),
                  activeColor: Colors.black),
              FlashyTabBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Highlights'),
                  activeColor: Colors.black),
              FlashyTabBarItem(
                  icon: Icon(Icons.settings),
                  title: Text('Settings'),
                  activeColor: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
