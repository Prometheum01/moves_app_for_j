// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterCategory _$FilterCategoryFromJson(Map<String, dynamic> json) =>
    FilterCategory(
      headerValue: json['headerValue'] as String,
      expandedValue: json['expandedValue'] as String,
      filterItemList: (json['filterItemList'] as List<dynamic>)
          .map((e) => FilterItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      isExpanded: json['isExpanded'] as bool? ?? false,
      isSelected: json['isSelected'] as int?,
    );

Map<String, dynamic> _$FilterCategoryToJson(FilterCategory instance) =>
    <String, dynamic>{
      'headerValue': instance.headerValue,
      'expandedValue': instance.expandedValue,
      'filterItemList': instance.filterItemList,
      'isExpanded': instance.isExpanded,
      'isSelected': instance.isSelected,
    };
