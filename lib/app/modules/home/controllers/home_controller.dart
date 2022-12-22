import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class HomeController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController lineAnimcon;
  late Animation lineAnim;
  @override
  void onInit() {
    lineAnimcon = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        lowerBound: 0.0,
        upperBound: 100.0);
    lineAnim = Tween(begin: 0.0, end: 100.0).animate(lineAnimcon);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
