
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutter/controller/favorite_controller.dart';
import 'package:newflutter/core/class/handlingdataview.dart';
import 'package:newflutter/view/widget/myfavorite/customlistfavoriteitems.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){

    Get.put(FavoriteController());
    
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<FavoriteController>(
            builder: ((controller) => ListView(children: [
                  // CustomAppBar(
                  //   titleappbar: "Find Product", 
                  //   onPressedSearch: () {},
                  //   onPressedIconFavorite: () {
                  //     Get.toNamed(AppRoute.myfavroite);
                  //   },
                  // ),
                  SizedBox(height: 20) ,
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        // itemCount: controller.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.7),
                        itemBuilder: (context, index) {
                          return  CustomListFavoriteItems(itemsModel: controller.data[index]) ; 
                        },
                      ))
                ]))),
      ),
    );
  }
}