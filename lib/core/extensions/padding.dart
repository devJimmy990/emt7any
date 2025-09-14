import 'package:flutter/material.dart';

extension WidgetPadding on Widget {
  Widget withPadding(EdgeInsetsGeometry padding) =>
      Padding(padding: padding, child: this);
}
