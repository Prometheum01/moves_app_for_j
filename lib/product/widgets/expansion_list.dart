import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:moves_app_for_job/core/provider/search_filter_provider.dart';
import 'package:provider/provider.dart';

import '../models/filter_items_model/filter_items.dart';

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
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(
                    '${category.headerValue}: ${category.selectedItemValue}'),
              );
            },
            body: SizedBox(
              height: context.dynamicHeight(0.25),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: category.filterItemList.length,
                itemBuilder: (context, index) {
                  FilterItems item = category.filterItemList[index];
                  return CheckboxListTile(
                    value: index == category.isSelected,
                    onChanged: (value) {
                      context
                          .read<SearchFilterProvider>()
                          .changeSelectedItem(category, index);
                    },
                    title: Text(item.headerValue),
                  );
                },
              ),
            ),
            isExpanded: category.isExpanded,
          );
        },
      ).toList(),
    );
  }
}
