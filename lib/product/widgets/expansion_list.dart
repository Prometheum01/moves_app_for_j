import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:moves_app_for_job/core/provider/search_filter_provider.dart';
import 'package:moves_app_for_job/product/constants/color_constants.dart';
import 'package:provider/provider.dart';

import '../models/filter_items_model/filter_category.dart';

class ExpansionListItem extends StatefulWidget {
  const ExpansionListItem({
    Key? key,
  }) : super(key: key);

  @override
  State<ExpansionListItem> createState() => _ExpansionListItemState();
}

class _ExpansionListItemState extends State<ExpansionListItem> {
  @override
  Widget build(BuildContext context) {
    List<FilterCategory> filterCategory =
        context.watch<SearchFilterProvider>().filterList;
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        context
            .read<SearchFilterProvider>()
            .changeExpanded(filterCategory[index], isExpanded);
      },
      children: filterCategory.map<ExpansionPanel>(
        (FilterCategory category) {
          return ExpansionPanel(
            canTapOnHeader: true,
            backgroundColor: ColorConst.blizzardBlue,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return _ExpansionCategoryWidget(
                filterCategory: category,
              );
            },
            body: _ExpansionItemList(filterCategory: category),
            isExpanded: category.isExpanded,
          );
        },
      ).toList(),
    );
  }
}

class _ExpansionItemList extends StatelessWidget {
  const _ExpansionItemList({
    Key? key,
    required this.filterCategory,
  }) : super(key: key);

  final FilterCategory filterCategory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.25),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: filterCategory.filterItemList.length,
        itemBuilder: (context, index) {
          return _ExpansionListItemWidget(
              filterCategory: filterCategory, index: index);
        },
      ),
    );
  }
}

class _ExpansionListItemWidget extends StatelessWidget {
  const _ExpansionListItemWidget(
      {Key? key, required this.filterCategory, required this.index})
      : super(key: key);

  final FilterCategory filterCategory;
  final int index;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: index == filterCategory.isSelected,
      onChanged: (value) {
        context
            .read<SearchFilterProvider>()
            .changeSelectedItem(filterCategory, index);
      },
      activeColor: ColorConst.skyBlueCrayola,
      checkColor: ColorConst.lightCyan,
      title: Text(filterCategory.filterItemList[index].headerValue,
          style: context.textTheme.headline6),
    );
  }
}

class _ExpansionCategoryWidget extends StatelessWidget {
  const _ExpansionCategoryWidget({
    Key? key,
    required this.filterCategory,
  }) : super(key: key);

  final FilterCategory filterCategory;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${filterCategory.headerValue}: ${filterCategory.selectedItemValue}',
        style: context.textTheme.headline6,
      ),
    );
  }
}
