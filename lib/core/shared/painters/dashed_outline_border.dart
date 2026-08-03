import 'dart:ui';

import 'package:flutter/material.dart';

class DashedOutlineBorder extends OutlinedBorder {
  final double dashWidth;
  final double dashSpace;
  final BorderRadius borderRadius;

  const DashedOutlineBorder({
    super.side,
    this.dashWidth = 6,
    this.dashSpace = 4,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  OutlinedBorder copyWith({BorderSide? side}) => DashedOutlineBorder(
    side: side ?? this.side,
    dashWidth: dashWidth,
    dashSpace: dashSpace,
    borderRadius: borderRadius,
  );

  @override
  OutlinedBorder scale(double t) => DashedOutlineBorder(
    side: side.scale(t),
    dashWidth: dashWidth,
    dashSpace: dashSpace,
    borderRadius: borderRadius * t,
  );

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      Path()..addRRect(borderRadius.toRRect(rect).deflate(side.width));

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      Path()..addRRect(borderRadius.toRRect(rect));

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (side.style == BorderStyle.none) return;

    final Paint paint = Paint()
      ..color = side.color
      ..strokeWidth = side.width
      ..style = PaintingStyle.stroke;

    final Path path = Path()..addRRect(borderRadius.toRRect(rect));
    final Path dashPath = Path();

    for (final PathMetric metric in path.computeMetrics()) {
      for (
        double distance = 0.0;
        distance < metric.length;
        distance += dashWidth + dashSpace
      ) {
        dashPath.addPath(
          metric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
      }
    }
    canvas.drawPath(dashPath, paint);
  }
}
