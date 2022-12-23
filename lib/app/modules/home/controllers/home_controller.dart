import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController lineAnimCon;
  RxBool showLines = false.obs;

  RxString text = 'Pause'.obs;

  RxString lineText = 'Show Lines'.obs;
  @override
  void onInit() {
    lineAnimCon = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 10),
        lowerBound: 0.0,
        upperBound: 360.0);
    super.onInit();
  }

  @override
  void onReady() {
    lineAnimCon.forward();
    lineAnimCon.addListener(() {
      update(['i']);
      if (lineAnimCon.isCompleted) {
        lineAnimCon.reverse();
      }
      if (lineAnimCon.isDismissed) {
        lineAnimCon.forward();
      }
    });
    super.onReady();
  }

  @override
  void onClose() {
    lineAnimCon.dispose();
    super.onClose();
  }

  void pauseAnimation() {
    if (lineAnimCon.isAnimating) {
      lineAnimCon.stop();
      text.value = 'Play';
    } else {
      lineAnimCon.forward();
      text.value = 'Pause';
    }
  }

  void showLinesClicked() {
    showLines.value = !showLines.value;
    showLines.value 
    ? lineText.value = 'No Lines'
    : lineText.value = 'Show Lines';
  }
}
