
import 'package:get/get.dart';
import 'package:newflutter/core/constant/routes.dart';
import 'package:newflutter/core/middleware/mymiddleware.dart';
import 'package:newflutter/test_view.dart';
import 'package:newflutter/view/address/add.dart';
import 'package:newflutter/view/address/adddetails.dart';
import 'package:newflutter/view/address/view.dart';
import 'package:newflutter/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:newflutter/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:newflutter/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:newflutter/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:newflutter/view/screen/auth/login.dart';
import 'package:newflutter/view/screen/auth/signup.dart';
import 'package:newflutter/view/screen/auth/success_signup.dart';
import 'package:newflutter/view/screen/auth/verifycodesignup.dart';
import 'package:newflutter/view/screen/cart.dart';
import 'package:newflutter/view/screen/home.dart';
import 'package:newflutter/view/screen/homescreen.dart';
import 'package:newflutter/view/screen/items.dart';
import 'package:newflutter/view/screen/language.dart';
import 'package:newflutter/view/screen/myfavorite.dart';
import 'package:newflutter/view/screen/onbording.dart';
import 'package:newflutter/view/screen/productdetails.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const HomeScreen()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
//  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  //
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Items(), arguments: Get.arguments),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite()),
  //
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.addressadddetails, page: () => const AddressAddDetails())
];