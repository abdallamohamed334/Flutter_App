
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutter/controller/home_controller.dart';
import 'package:newflutter/core/class/statusrequest.dart';
import 'package:newflutter/core/functions/handingdatacontroller.dart';
import 'package:newflutter/core/services/services.dart';
import 'package:newflutter/data/datasource/remote/items_data.dart';
import 'package:newflutter/data/model/itemsmodel.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val, String catval);
  getItems(String categoryid);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends SearchMixController {
  List categories = [];
  String? catid;
  int? selectedCat;

  ItemsData testData = ItemsData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  void onInit() {
     search = TextEditingController();
    intialData();
    super.onInit();
  }

 
  intialData() {
  
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getItems(catid!);
  }

  
  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }

  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.getData(
        categoryid, categoryid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  // ignore: override_on_non_overriding_member
  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}


























// class FavoriteController extends GetxController {
//   Map isFavorite = {};

//   setFavorite(id, val) {
//     isFavorite[id] = val;
//     print(isFavorite[id]);
//     update();
//   }
// }