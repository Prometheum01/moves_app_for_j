import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class CustomTextButton extends TextButton {
  CustomTextButton(
      {super.key,
      required Function onPressed,
      required String text,
      required TextStyle? textStyle})
      : super(
          onPressed: () {
            onPressed();
          },
          style: TextButton.styleFrom(
            backgroundColor: ColorConst.lightCyan,
          ),
          child: Text(
            text,
            style: textStyle?.copyWith(
                color: ColorConst.skyBlueCrayola, fontSize: 18),
          ),
        );
}
