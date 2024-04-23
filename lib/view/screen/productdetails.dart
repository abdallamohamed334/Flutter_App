
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutter/controller/productdetails_controller.dart';
import 'package:newflutter/core/class/handlingdataview.dart';
import 'package:newflutter/core/constant/color.dart';
import 'package:newflutter/core/constant/routes.dart';
import 'package:newflutter/view/widget/productdetails/priceandcount.dart';
import 'package:newflutter/view/widget/productdetails/subitemslist.dart';
import 'package:newflutter/view/widget/productdetails/toppageproductdetails.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColor.secondColor,
                onPressed: () {
                  Get.toNamed(AppRoute.cart);
                },
                child: const Text(
                  "Contact",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  const TopProductPageDetails(),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${controller.itemsModel.itemsName}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    color: AppColor.fourthColor,
                                  )),
                          const SizedBox(height: 10),
                          PriceAndCountItems(
                              onAdd: () {
                                controller.add();
                              },
                              onRemove: () {
                                controller.remove();
                              },
                              price: "${controller.itemsModel.itemsPrice}",
                              count: "1"),
                          const SizedBox(height: 20),
                          Text("${controller.itemsModel.itemsDesc}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: AppColor.grey2)),
                          const SizedBox(height: 10),
                          Text("Place environment",
                              style: Theme.of(context).textTheme.headline1!.copyWith(
                                    color: AppColor.fourthColor,
                                  )),
                          const SizedBox(height: 10),
                          const SubitemsList(),
                          const Text(
            'About',
            style: TextStyle(
              color: AppColor.mTitleTextColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            '${controller.itemsModel.itemsDesc}',
            style: TextStyle(
              color: AppColor.mBodyTextColor,
              fontSize: 14,
            ),
          )
                          
                        ]),
                  )
                  
                ]))));
  }
}