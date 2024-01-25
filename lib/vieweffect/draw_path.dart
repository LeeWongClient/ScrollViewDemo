import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;
class DrawCurvePath extends StatefulWidget {
  const DrawCurvePath({super.key});

  @override
  State<DrawCurvePath> createState() => _DrawCurvePathState();
}

class _DrawCurvePathState extends State<DrawCurvePath> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curve Painter Demo'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: SplinePainter(),
          ),
        ),
      ),
    );
  }
}


class TranglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final path = Path();

    // 曲线起始点
    path.moveTo(0, 0);

    // 控制点1
    final controlPoint1 = Offset(size.width / 2, size.height);

    // 控制点2
    // final controlPoint2 = Offset(size.width / 2 + 10, size.height);

    // 结束点
    final endPoint = Offset(size.width, 0);

    // 绘制贝塞尔曲线
    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint1.dx,
        controlPoint1.dy, endPoint.dx, endPoint.dy);

    // 绘制曲线路径
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CurvePainter oldDelegate) => false;
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final path = Path();

    // 曲线起始点
    path.moveTo(0, size.height / 2);

    // 控制点1
    final controlPoint1 = Offset(size.width / 4, size.height / 4);

    // 控制点2
    final controlPoint2 = Offset(size.width / 2, size.height * 3 / 4);

    // 结束点
    final endPoint = Offset(size.width, size.height / 2);

    // 绘制贝塞尔曲线
    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
        controlPoint2.dy, endPoint.dx, endPoint.dy);

    // 绘制曲线路径
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CurvePainter oldDelegate) => false;
}


/// 二次曲线
class BezierCurvePainter extends CustomPainter {
  const BezierCurvePainter();

  @override
  void paint(Canvas canvas, Size size) {
    // 将整个画布的颜色涂成白色
    Paint paint = Paint()
      ..color = Colors.white;
    canvas.drawPaint(paint);
    // 画贝塞尔曲线
    Path bezierPath = Path()
      ..moveTo(0, size.height)//移动起点到(0, size.height)
      ..lineTo(0, size.height*0.8)//画线
      ..quadraticBezierTo(
          size.width / 2,
          size.height * 0.6,
          size.width,
          size.height * 0.8
      )
      ..lineTo(size.width, size.height);

    final bezierPaint = Paint()
    // 添加渐变色
      ..shader = const LinearGradient(
          colors: [Colors.blue,Colors.green]
      ).createShader(Offset(0,size.height * 0.8) & size);

    canvas.drawPath(bezierPath, bezierPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

/// CatmulRomSpline
class SplinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white;
    canvas.drawPaint(paint);

    //控制点宽
    const controlWidthSingle = 50;
    final random = math.Random();
    //生成控制点
    final controlPoints = List.generate(size.width ~/ controlWidthSingle, (index) {
      return Offset(
          controlWidthSingle * (index + 1),
          random.nextDouble() * (size.height - size.height / 2) + size.height /2
      );
    }).toList();

    //返回一个Offset值列表
    final spline = CatmullRomSpline(controlPoints);

    final bezierPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10
      ..shader = const LinearGradient(
          colors: [Colors.blue,Colors.green]
      ).createShader(Offset(0, size.height) & size);

    //绘制所有offset点
    canvas.drawPoints(
        PointMode.points,
        spline.generateSamples().map((e) => e.value).toList(),
        bezierPaint
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}