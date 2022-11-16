import 'package:flutter/material.dart';
import 'package:moves_app_for_job/core/constants/radius_const.dart';
import 'package:moves_app_for_job/product/constants/text_constants.dart';

class SearchBarInputDecoration extends InputDecoration {
  const SearchBarInputDecoration()
      : super(
          fillColor: Colors.white,
          enabledBorder: const SearchBarOutlineBorder(),
          focusedBorder: const SearchBarOutlineBorder(),
          filled: true,
          hintText: TextConstants.searchBarHintText,
        );
}

class SearchBarOutlineBorder extends OutlineInputBorder {
  const SearchBarOutlineBorder()
      : super(
          borderRadius: const RadiusConst.mediumAll(),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        );
}
