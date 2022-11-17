import 'package:flutter/widgets.dart';

class RadiusConst extends BorderRadius {
  const RadiusConst.largeAll()
      : super.all(
          const Radius.circular(32),
        );
  const RadiusConst.smallAll()
      : super.all(
          const Radius.circular(8),
        );
}
