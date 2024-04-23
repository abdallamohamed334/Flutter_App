
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutter/controller/favorite_controller.dart';
import 'package:newflutter/controller/items_controller.dart';
import 'package:newflutter/core/constant/color.dart';
import 'package:newflutter/core/constant/imgaeasset.dart';
import 'package:newflutter/core/functions/translatefatabase.dart';
import 'package:newflutter/data/model/itemsmodel.dart';
import 'package:newflutter/linkapi.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  // final bool active;
  const CustomListItems({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToPageProductDetails(itemsModel);
        },
        borderRadius: BorderRadius.circular(15.0),
            splashColor: Color.fromARGB(255, 218, 13, 13),
            highlightColor: Colors.white70,
        child: Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    children: [
                      Hero(
                        tag: "${itemsModel.itemsId}",
                        child: CachedNetworkImage(
                          imageUrl:
                              AppLink.imagestItems + "/" + itemsModel.itemsImage!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                          translateDatabase(
                              itemsModel.itemsNameAr, itemsModel.itemsName),
                          style: const TextStyle(
                              color: AppColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Rating 3.5 ", textAlign: TextAlign.center),
                          Container(
                            alignment: Alignment.bottomCenter,
                            height: 30,
                            child: Row(
                              children: [
                                ...List.generate(
                                    5,
                                    (index) => const Icon(
                                          Icons.star,
                                          size: 20,
                                        ))
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${itemsModel.itemsPrice} \$",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 38, 0, 143),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "sans")),
                          Text("${itemsModel.items_nuroom} room",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 38, 0, 143),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "cairo")),
                          
                          GetBuilder<FavoriteController>(
                              builder: (controller) => IconButton(
                                  onPressed: () {
                                    if (controller.isFavorite[itemsModel.itemsId] ==
                                        "1") {
                                      controller.setFavorite(
                                          itemsModel.itemsId, "0");
                                      controller
                                          .removeFavorite(itemsModel.itemsId!);
                                    } else {
                                      controller.setFavorite(
                                          itemsModel.itemsId, "1");
                                      controller.addFavorite(itemsModel.itemsId!);
                                    }
                                  },
                                  icon: Icon(
                                    controller.isFavorite[itemsModel.itemsId] == "1"
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color: AppColor.primaryColor,
                                  )))
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${itemsModel.items_nuroom} room",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 38, 0, 143),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "cairo")),

                        ],
                      )
                    ]),
              ),
           if (itemsModel.itemsDiscount != "0")   Positioned(
                top: 4,
                left: 4,
                child: Image.asset(AppImageAsset.logo , width: 40,))
            ],
          ),
        ));
  }
}






























// logical thinking

  // GetBuilder<FavoriteController>(
  //                         builder: (controller) => IconButton(
  //                             onPressed: () {
  //                                 if (controller.isFavorite[itemsModel.itemsId] == "1" ) {
  //                                   controller.setFavorite(
  //                                       itemsModel.itemsId, "0");
  //                                 } else {
  //                                   controller.setFavorite(
  //                                       itemsModel.itemsId, "1");
  //                                 }
  //                             },
  //                             icon: Icon(
  //                               controller.isFavorite[itemsModel.itemsId] == "1"
  //                                   ? Icons.favorite
  //                                   : Icons.favorite_border_outlined,
  //                               color: AppColor.primaryColor,
  //                             )))