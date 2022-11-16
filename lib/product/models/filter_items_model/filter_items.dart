import 'package:moves_app_for_job/product/constants/text_constants.dart';

class FilterCategory {
  final String headerValue;
  final String expandedValue;
  final List<FilterItems> filterItemList;
  bool isExpanded;
  int? isSelected;

  FilterCategory({
    required this.headerValue,
    required this.expandedValue,
    required this.filterItemList,
    this.isExpanded = false,
    this.isSelected,
  });

  String get selectedItemValue => isSelected != null
      ? filterItemList[isSelected!].headerValue
      : TextConstants.filterSelectedNoneText;
}

class FilterItems {
  FilterItems({
    required this.expandedValue,
    required this.headerValue,
  });

  String expandedValue;
  String headerValue;
}
