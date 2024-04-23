
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutter/view/screen/home.dart';
import 'package:newflutter/view/screen/profile/profile_screen.dart';
import 'package:newflutter/view/screen/settingpage/account_screen.dart';
import 'package:newflutter/view/screen/settingpage/edit_screen.dart';
import 'package:newflutter/view/screen/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
     HomePage(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("Profile"))],
    ),
     const ProfileScreen(),
    const AccountScreen(),
   
  ];

  List bottomappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "notifications", "icon": Icons.notifications_active_outlined},
    {"title": "profile", "icon": Icons.person_pin_sharp},
    {"title": "settings", "icon": Icons.settings}
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}