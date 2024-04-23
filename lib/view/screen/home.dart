
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutter/controller/home_controller.dart';
import 'package:newflutter/core/class/handlingdataview.dart';
import 'package:newflutter/core/constant/routes.dart';
import 'package:newflutter/data/model/itemsmodel.dart';
import 'package:newflutter/linkapi.dart';
import 'package:newflutter/view/widget/best_offer.dart';
import 'package:newflutter/view/widget/customappbar.dart';
import 'package:newflutter/view/widget/home/customcardhome.dart';
import 'package:newflutter/view/widget/home/customtitlehome.dart';
import 'package:newflutter/view/widget/home/listcategorieshome.dart';
import 'package:newflutter/view/widget/home/listitemshome.dart';
class HomePage extends StatelessWidget {
   const HomePage({Key? key}) : super(key: key);
    BestOffer bestOffer() {
   // TODO: implement bestOffer
   throw UnimplementedError();
    }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                
                CustomAppBar(
                  
                  mycontroller: controller.search!,
                  titleappbar: "Search here......",
                  // onPressedIcon: () {},
                  onPressedSearch: () {
                    controller.onSearchItems();
                  },
                  onChanged: (val) {
                    controller.checkSearch(val);
                  },
                  onPressedIconFavorite: () {
                    Get.toNamed(AppRoute.myfavroite);
                  },
                ),
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: !controller.isSearch
                        ? const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomCardHome(
                                  title: "A summer surprise",
                                  body: "Cashback 20%"),
                              CustomTitleHome(title: "Categories"),
                              ListCategoriesHome(),
                              CustomTitleHome(title: "Product for you"),
                              ListItemsHome(),
                             
                            ]
                            ,
                          )
                        : ListItemsSearch(listdatamodel: controller.listdata)
                        )

                
                // const ListItemsHome()
                
              ],
            )));
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imagestItems}/${listdatamodel[index].itemsImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].itemsName!),
                          subtitle: Text(listdatamodel[index].categoriesName!),
                        )),
                  ],
                ),
              )),
            ),
          );
        }
        
        )
        ;
  }
}
