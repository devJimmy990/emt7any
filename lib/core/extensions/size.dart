import 'package:flutter/material.dart';

extension SizeExtension on num {
  double get w => toDouble();
  double get h => toDouble();
}

extension SizeContextExtension on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
}
