import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController lineAnimCon;
  RxDouble animVal = 0.0.obs;
  @override
  void onInit() {
    lineAnimCon = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 5),
        lowerBound: 0.0,
        upperBound: 360.0);
    super.onInit();
  }

  @override
  void onReady() {
    lineAnimCon.forward();
    lineAnimCon.addListener(() {
      update(['i']);
    });
    super.onReady();
  }

  @override
  void onClose() {
    lineAnimCon.dispose();
    super.onClose();
  }
}
