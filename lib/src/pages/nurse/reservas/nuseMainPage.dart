
import 'package:app/src/pages/client/Search/searchPage.dart';
import 'package:app/src/pages/client/address/map/client_address_map_main.dart';
import 'package:app/src/pages/client/address/map/client_address_map_page.dart';
import 'package:app/src/pages/client/enfermeros/clientMain_controller.dart';
import 'package:app/src/pages/client/home/home_page.dart';
import 'package:app/src/pages/client/profile/info/profilePage.dart';
import 'package:app/src/pages/client/settings/settings_page.dart';
import 'package:app/src/pages/favorite/favorite_page.dart';
import 'package:app/src/pages/nurse/home/homeNurse_page.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NurseMainPage extends StatelessWidget {
  ClientMainController cont = Get.put(ClientMainController());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomBar(),
      body: Obx (() => IndexedStack(
        index: cont.indexTap.value,
        children: [
          HomeNursePage(),
          SettingsPage(),
        ],
      ))
    );
  }

  Widget _bottomBar(){
    return Obx(() =>  FlashyTabBar(
      iconSize: 25,
      showElevation: true,
      backgroundColor: Colors.white,
      items: [
              FlashyTabBarItem(
                  icon: Icon(Icons.home_filled),
                  title: Text('Inicio'),
                  activeColor: Colors.black),
              FlashyTabBarItem(
                  icon: Icon(Icons.settings),
                  title: Text('Opciones'),
                  activeColor: Colors.black),
            ], 
      selectedIndex: cont.indexTap.value,
      onItemSelected: (index) => cont.changeTab(index),
    ));
  }

}