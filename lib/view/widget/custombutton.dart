
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutter/controller/onboarding_controller.dart';
import 'package:newflutter/core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
          textColor: Colors.white,
          onPressed: () {
            controller.next() ; 
          },
          color: const Color.fromARGB(255, 109, 140, 242),
          
          child: const Text("Continue")),
    );
  }
}