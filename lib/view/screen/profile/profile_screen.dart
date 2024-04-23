
import 'package:flutter/material.dart';
import 'package:newflutter/core/constant/imgaeasset.dart';
import 'package:newflutter/view/screen/auth/login.dart';
import 'package:newflutter/view/screen/profile/profile_menu.dart';
import 'package:newflutter/view/screen/profile/profile_pic.dart';
import 'package:newflutter/view/screen/settingpage/edit_screen.dart';
import 'package:newflutter/view/screen/settings.dart';



class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: AppImageAsset.profile,
              press: () => {
                Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const editAccountScreen()))
              },
            ),
            ProfileMenu(
              text: "Contact us",
              icon: AppImageAsset.bell,
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: AppImageAsset.setting,
              press: () {Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Settings()));},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: AppImageAsset.Question,
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: AppImageAsset.log,
              press: () {Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));} ,
            )
            
          ],
        ),
      ),
    );
  }
}