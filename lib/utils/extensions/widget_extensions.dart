import 'package:flutter/material.dart';

extension ListWidgetExtension on List<Widget> {
  List<Widget> withSpacing(Widget spacer) => expand(
        (element) sync* {
          yield spacer;
          yield element;
        },
      ).skip(1).toList();
}
