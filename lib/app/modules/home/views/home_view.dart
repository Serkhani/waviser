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
              id: 'i',
              builder: (controller) {
                return CustomPaint(
                  painter: LinePainter(progress: controller.lineAnimCon.value),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
// class LinePainter extends CustomPainter {
//   final Offset center;
//   final Offset end;

//   LinePainter(this.center, this.end);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 3
//       ..style = PaintingStyle.stroke;

//     canvas.drawLine(center, end, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }

class LinePainter extends CustomPainter {
  final double progress;
  const LinePainter({required this.progress});
  @override
  void paint(Canvas canvas, Size size) {
    Paint painter = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
    Offset center = Offset.zero;
    final double x = 100.0 * math.cos(progress * math.pi / 180);
    final double y = 100.0 * math.sin(progress * math.pi / 180);
    final path = Path();
    path.moveTo(center.dx, center.dy);
    path.lineTo(x - center.dx, y - center.dy);
    path.lineTo(x - center.dx, 0.0);
    path.close();

    // Calculate the end point of the line on the circle
    final Offset end = Offset(x, y);
    canvas.drawPath(path, painter);
    // canvas.drawLine(Offset.zero, end, painter);
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
