import 'package:flutter/material.dart';
import 'package:moves_app_for_job/core/constants/radius_const.dart';
import 'package:moves_app_for_job/product/constants/text_constants.dart';

import '../../product/constants/color_constants.dart';

class SearchBarInputDecoration extends InputDecoration {
  SearchBarInputDecoration({required void Function() onPressed})
      : super(
          fillColor: ColorConst.blizzardBlue,
          enabledBorder: const _SearchBarOutlineBorder(),
          focusedBorder: const _SearchBarOutlineBorder(),
          filled: true,
          suffixIcon: IconButton(
            onPressed: () {
              onPressed.call();
            },
            splashRadius: 24,
            splashColor: ColorConst.skyBlueCrayola,
            icon: const Icon(
              Icons.search,
              color: ColorConst.skyBlueCrayola,
            ),
          ),
          hintText: TextConstants.searchBarHintText,
        );
}

class _SearchBarOutlineBorder extends OutlineInputBorder {
  const _SearchBarOutlineBorder()
      : super(
          borderRadius: const RadiusConst.largeAll(),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        );
}
