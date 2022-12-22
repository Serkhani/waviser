import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            CustomPaint(
              painter: CirclePainter(),
            ),
            GetBuilder<HomeController>(
              builder: (controller) {
                return CustomPaint(
                  painter: LinePainter(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint painter = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    canvas.drawLine(Offset.zero, const Offset(0.0, 100.0), painter);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) => false;
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint painter = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
    canvas.drawCircle(Offset.zero, 100.0, painter);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => false;
}
//  animatePath(Rect oval, Paint paint, Canvas canvas, double progress) {
//     canvas.drawArc(oval, 0.0, progress, true, paint);
    // PathMetrics pathMetrics = path.computeMetrics();
    // for (PathMetric pathMetric in pathMetrics) {
    //   Path path_ = pathMetric.extractPath(0.0, pathMetric.length * progress);
    //   canvas.drawPath(path_, paint);
    // }