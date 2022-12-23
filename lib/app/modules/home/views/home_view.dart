import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      scaleFactor: 300.0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Visualizing Sine and Cosine Curves'),
        ),
        persistentFooterButtons: [
          Obx(
            () => FloatingActionButton(
              child: Text(controller.text.value),
              onPressed: () => controller.pauseAnimation(),
            ),
          ),
          Obx(
            () => FloatingActionButton(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                child: Text(controller.lineText.value),
              ),
              onPressed: () => controller.showLinesClicked(),
            ),
          )
        ],
        body: Transform.scale(
          scale: 0.5,
          child: Center(
            child: Stack(
              children: [
                CustomPaint(
                  painter: CirclePainter(),
                ),
                GetBuilder<HomeController>(
                  id: 'i',
                  builder: (controller) {
                    return Obx(() => CustomPaint(
                          painter: LinePainter(
                              showLines: controller.showLines.value,
                              progress: controller.lineAnimCon.value),
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final double progress;
  final bool showLines;
  const LinePainter({required this.progress, required this.showLines});
  @override
  void paint(Canvas canvas, Size size) {
    const double amplitude = 100.0;
    Paint painter = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
    Paint linePainter = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
    final double x = amplitude * math.cos(progress * math.pi / 45);
    final double y = amplitude * math.sin(progress * math.pi / 45);

    final path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(x, y);
    path.lineTo(x, 0.0);
    path.close();
    canvas.drawPath(path, painter);

// sine wave

    for (int sinX = 0; sinX < progress; sinX++) {
      final double sinY = amplitude * math.sin((4 * math.pi * sinX) / 180.0);

      if (sinX == 0) {
        path.moveTo(amplitude, 0.0);
      } else {
        path.lineTo(amplitude + sinX, sinY);
      }
    }
    if (showLines) {
      canvas.drawLine(
          Offset(x, y), Offset(amplitude + progress, y), linePainter);
    }
    canvas.drawPath(path, painter);

// cos wave

    for (int cosY = 0; cosY < progress; cosY++) {
      final double cosX = amplitude * math.cos((4 * math.pi * cosY) / 180.0);

      if (cosY == 0) {
        path.moveTo(0.0, amplitude);
      } else {
        path.lineTo(cosX, amplitude + cosY.toDouble());
      }
    }
    if (showLines) {
      canvas.drawLine(
          Offset(x, y), Offset(x, amplitude + progress), linePainter);
    }
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) => true;
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
