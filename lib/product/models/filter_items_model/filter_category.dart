import 'package:json_annotation/json_annotation.dart';
import 'package:moves_app_for_job/product/models/filter_items_model/filter_items.dart';

import '../../constants/text_constants.dart';

part 'filter_category.g.dart';

@JsonSerializable()
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

  factory FilterCategory.fromJson(Map<String, dynamic> json) =>
      _$FilterCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$FilterCategoryToJson(this);
}
