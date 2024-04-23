 import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutter/bindings/intialbindings.dart';
import 'package:newflutter/core/localization/translation.dart';
import 'package:newflutter/core/services/services.dart';
import 'package:newflutter/routes.dart';
import 'core/localization/changelocal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.appTheme, 
      initialBinding:InitialBindings() ,
      // routes: routes,
      getPages: routes,
    );
  }
}
 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}