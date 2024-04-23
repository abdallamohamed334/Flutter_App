import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutter/controller/onboarding_controller.dart';
import 'package:newflutter/view/widget/custombutton.dart';
import 'package:newflutter/view/widget/customslider.dart';
import 'package:newflutter/view/widget/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp()); 
    return const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            Expanded(
              flex: 3,
              child: CustomSliderOnBoarding()
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomDotControllerOnBoarding(),
                    Spacer(flex: 2),
                    CustomButtonOnBoarding()
                  ],
                ))
          ]),
        ));
  }
}