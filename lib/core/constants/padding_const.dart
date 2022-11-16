import 'package:flutter/material.dart';

class PaddingConst extends EdgeInsets {
  const PaddingConst.mediumAll() : super.all(8);
  const PaddingConst.mediumHorizontalSymmetric()
      : super.symmetric(horizontal: 8);
  const PaddingConst.mediumVerticalSymmetric() : super.symmetric(vertical: 8);
}
