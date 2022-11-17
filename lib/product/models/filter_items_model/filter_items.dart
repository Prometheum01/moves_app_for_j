import 'package:json_annotation/json_annotation.dart';

part 'filter_items.g.dart';

@JsonSerializable()
class FilterItems {
  FilterItems({
    required this.expandedValue,
    required this.headerValue,
  });

  String expandedValue;
  String headerValue;

  factory FilterItems.fromJson(Map<String, dynamic> json) =>
      _$FilterItemsFromJson(json);

  Map<String, dynamic> toJson() => _$FilterItemsToJson(this);
}
