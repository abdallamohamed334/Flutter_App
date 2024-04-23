import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:newflutter/core/class/statusrequest.dart';
import 'package:newflutter/core/constant/routes.dart';


class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;

  Completer<GoogleMapController>? completercontroller;

  // List<Marker> markers = [];

  double? lat;
  double? long;

  addMarkers(LatLng latLng) {
    // markers.clear();
    // markers.add(const Marker(markerId: MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  goToPageAddDetailsAddress() {
    Get.toNamed(AppRoute.addressadddetails,
        arguments: {"lat": lat.toString(), "long": long.toString()});
  }

  Position? postion;

  CameraPosition? kGooglePlex;

  getCurrentLocation() async {
    postion = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(postion!.latitude, postion!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}