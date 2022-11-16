import 'package:flutter/material.dart';
import 'package:moves_app_for_job/core/constants/input_decoration.dart';

class SearchBar extends TextFormField {
  SearchBar(
      {super.key,
      required TextEditingController controller,
      required Function(String name) search})
      : super(
          cursorColor: Colors.black,
          controller: controller,
          onFieldSubmitted: (value) {
            search(value);
          },
          decoration: const SearchBarInputDecoration(),
        );
}
