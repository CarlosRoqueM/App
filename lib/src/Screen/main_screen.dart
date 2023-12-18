import 'package:app/src/Screen/side_menu_list.dart';
import 'package:app/src/pages/favorite/favorite_page.dart';
import 'package:app/src/pages/home/home_page.dart';
import 'package:app/src/pages/profile/profile_page.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/utils/global_color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

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
      const HomePage(),
      const FavoritePage(),
      const ProfilePage()
    ];

    return SideMenu(
      background: GlobalColors.fourthColor,
      key: sideMenuKey,
      menu: SideMenuList(),
      maxMenuWidth: 280,
      child: BackgroundTemplate(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 50,
            leading: IconButton(
                splashColor: Colors.white,
                onPressed: () {
                  if (sideMenuKey.currentState!.isOpened) {
                    sideMenuKey.currentState!.closeSideMenu();
                  } else {
                    sideMenuKey.currentState!.openSideMenu();
                  }
                },
                iconSize: 32,
                icon: Icon(Icons.menu)),
          ),
          body: IndexedStack(
            index: selectedIndex,
            children: screens,
          ),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: CurvedNavigationBar(
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
          ),
        ),
      ),
    );
  }
}
