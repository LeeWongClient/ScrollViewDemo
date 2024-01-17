import 'package:flutter/material.dart';
import 'dart:math' as math;

///新增一个倾斜的圆角矩形. 斜边高度默认[Sizes.italicHeight]. 如果使用了
///该Shape, 那么child Widget需要调整一下上边距的高度. 请参考[ReportPage]
///它增加了顶部的内边距.
///如果要用来裁剪Container等Widget, 请在[ClipPath]方法中使用[ItalicRoundedBorderShape],
///可以参考**chat_page.dart._openSelectGeoLocationPage()**方法.
class ItalicRoundedBorderShape extends BeveledRectangleBorder {
  final BorderRadius borderRadius;
  final double italicHeight;

  const ItalicRoundedBorderShape({
    BorderSide side = BorderSide.none,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.italicHeight = 16.0,
  }) : super(side: side);

  Path _getPath(RRect rrect, BorderRadius radius) {
    final Offset centerLeft = Offset(rrect.left, rrect.center.dy);
    final Offset centerRight = Offset(rrect.right, rrect.center.dy);
    final Offset centerTop = Offset(rrect.center.dx, rrect.top);
    final Offset centerBottom = Offset(rrect.center.dx, rrect.bottom);

    final double tlRadiusX = math.max(0.0, rrect.tlRadiusX);
    final double tlRadiusY = math.max(0.0, rrect.tlRadiusY);
    final double trRadiusX = math.max(0.0, rrect.trRadiusX);
    final double trRadiusY = math.max(0.0, rrect.trRadiusY);
    final double blRadiusX = math.max(0.0, rrect.blRadiusX);
    final double blRadiusY = math.max(0.0, rrect.blRadiusY);
    final double brRadiusX = math.max(0.0, rrect.brRadiusX);
    final double brRadiusY = math.max(0.0, rrect.brRadiusY);

    final rightTop = rrect.top;
    final leftTop = rrect.top + italicHeight;

    //共将八个点连成一个多边形.
    final List<Offset> vertices = <Offset>[
      Offset(rrect.left, math.min(centerLeft.dy, leftTop + tlRadiusY)),
      Offset(math.min(centerTop.dx, rrect.left + tlRadiusX), leftTop),
      Offset(math.max(centerTop.dx, rrect.right - trRadiusX), rightTop),
      Offset(rrect.right, math.min(centerRight.dy, rightTop + trRadiusY)),
      Offset(rrect.right, math.max(centerRight.dy, rrect.bottom - brRadiusY)),
      Offset(math.max(centerBottom.dx, rrect.right - brRadiusX), rrect.bottom),
      Offset(math.min(centerBottom.dx, rrect.left + blRadiusX), rrect.bottom),
      Offset(rrect.left, math.max(centerLeft.dy, rrect.bottom - blRadiusY)),
    ];
    final path = Path();
    int index = 0;
    for (int i = 0; i < vertices.length; i++) {
      final vertice = vertices[i];
      if (i % 2 == 0) {
        path.lineTo(vertice.dx, vertice.dy);
      } else {
        path.arcToPoint(vertice, radius: _getRadiusFromLTRB(index));
        index++;
      }
    }
    return path;
  }

  Radius _getRadiusFromLTRB(int index) {
    if (index == 0) return borderRadius.topLeft;
    if (index == 1) return borderRadius.topRight;
    if (index == 2) return borderRadius.bottomRight;
    if (index == 3) return borderRadius.bottomLeft;
    return borderRadius.topRight;
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    var radius = borderRadius.resolve(textDirection);
    return _getPath(radius.toRRect(rect).deflate(side.width), radius);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    var radius2 = borderRadius.resolve(textDirection);
    return _getPath(radius2.toRRect(rect), radius2);
  }
}