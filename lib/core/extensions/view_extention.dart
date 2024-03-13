import 'package:flutter/material.dart';

extension RowExtention on Row {
  Row withSpacing(double spacing) {
    var spacedChildren = children
        .expand((widget) => [widget, SizedBox(width: spacing)])
        .toList();
    spacedChildren.removeLast(); // Remove the extra SizedBox

    return Row(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: spacedChildren,
    );
  }
}

extension ColumnExtention on Column {
  Column withSpacing(double spacing) {
    var spacedChildren = children
        .expand((widget) => [widget, SizedBox(height: spacing.toDouble())])
        .toList();
    spacedChildren.removeLast(); // Remove the extra SizedBox

    return Column(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: spacedChildren,
    );
  }
}
