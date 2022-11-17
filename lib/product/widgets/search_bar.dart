import 'package:flutter/material.dart';
import 'package:moves_app_for_job/core/constants/input_decoration.dart';

import '../constants/color_constants.dart';

class SearchBar extends TextFormField {
  SearchBar(
      {super.key,
      required TextEditingController controller,
      required TextStyle? textStyle,
      required Function(String name) search})
      : super(
          cursorColor: ColorConst.skyBlueCrayola,
          controller: controller,
          onFieldSubmitted: (value) {
            search(value);
          },
          style: textStyle,
          decoration: SearchBarInputDecoration(
            onPressed: () {
              search(controller.value.text);
            },
          ),
        );
}
