import 'package:flutter/widgets.dart';

abstract class Paddings {
  const Paddings._();

  static const EdgeInsets all4 = EdgeInsets.all(4);
  static const EdgeInsets all8 = EdgeInsets.all(8);
  static const EdgeInsets all16 = EdgeInsets.all(16);

  static const EdgeInsets horizontal4 = EdgeInsets.symmetric(horizontal: 4);
  static const EdgeInsets horizontal8 = EdgeInsets.symmetric(horizontal: 8);
  static const EdgeInsets horizontal16 = EdgeInsets.symmetric(horizontal: 16);

  static const EdgeInsets vertical4 = EdgeInsets.symmetric(horizontal: 4);
  static const EdgeInsets vertical8 = EdgeInsets.symmetric(horizontal: 8);
  static const EdgeInsets vertical16 = EdgeInsets.symmetric(horizontal: 16);
}
