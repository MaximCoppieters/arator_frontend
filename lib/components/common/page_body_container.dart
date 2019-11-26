import 'package:flutter/material.dart';

class PageBodyContainer extends Container {
  /// The transformation matrix to apply before painting the container.
  final Matrix4 transform;
  PageBodyContainer({
    Key key,
    AlignmentGeometry alignment,
    EdgeInsetsGeometry padding,
    Color color,
    Decoration decoration,
    Decoration foregroundDecoration,
    double width,
    double height,
    BoxConstraints constraints,
    EdgeInsetsGeometry margin,
    this.transform,
    Widget child,
  }) : super(
          key: key,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          alignment: alignment,
          color: color,
          decoration: decoration,
          foregroundDecoration: foregroundDecoration,
          width: width,
          height: height,
          constraints: constraints,
          margin: margin,
          transform: transform,
          child: child,
        );
}
