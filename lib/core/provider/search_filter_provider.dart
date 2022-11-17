import 'package:flutter/widgets.dart';
import 'package:moves_app_for_job/product/constants/text_constants.dart';
import 'package:moves_app_for_job/product/services/move_service/move_service_const.dart';

import '../../product/models/filter_items_model/filter_category.dart';
import '../../product/models/filter_items_model/filter_items.dart';
import '../../product/models/filter_items_model/filter_items_consts.dart';

class SearchFilterProvider extends ChangeNotifier {
  // Bu listenin böyle tanımlanmaması gerektiğinin farkındayım direkt olarak databaseden çekmek daha iyi olur çünkü bir ekleme yapmak istediğimizde uygulamayı güncellemek gerekir.
  //Fakat aklıma başka bir yol gelmedi :(

  List<FilterCategory> filterList = [
    FilterCategory(
      headerValue: TextConstants.musclesTypeText,
      expandedValue: FilterItemsConst.muscleExpandedValue,
      filterItemList: [
        FilterItems(
          expandedValue: FilterItemsConst.muscleTypeAbdominals,
          headerValue: FilterItemsConst.muscleTypeAbdominals,
        ),
        FilterItems(
          expandedValue: FilterItemsConst.muscleTypeAbductors,
          headerValue: FilterItemsConst.muscleTypeAbductors,
        ),
        FilterItems(
          expandedValue: FilterItemsConst.muscleTypeAdductors,
          headerValue: FilterItemsConst.muscleTypeAdductors,
        ),
        FilterItems(
          expandedValue: FilterItemsConst.muscleTypeBiceps,
          headerValue: FilterItemsConst.muscleTypeBiceps,
        ),
        FilterItems(
          expandedValue: FilterItemsConst.muscleTypeChest,
          headerValue: FilterItemsConst.muscleTypeChest,
        ),
        FilterItems(
          expandedValue: FilterItemsConst.muscleTypeForearms,
          headerValue: FilterItemsConst.muscleTypeForearms,
        ),
        FilterItems(
          expandedValue: FilterItemsConst.muscleTypeGlutes,
          headerValue: FilterItemsConst.muscleTypeGlutes,
        ),
        FilterItems(
          expandedValue: FilterItemsConst.muscleTypeHamstrings,
          headerValue: FilterItemsConst.muscleTypeHamstrings,
        ),
        FilterItems(
          expandedValue: FilterItemsConst.muscleTypeLats,
          headerValue: FilterItemsConst.muscleTypeLats,
        ),
        FilterItems(
          expandedValue: FilterItemsConst.muscleTypeLowerbackMiddleback,
          headerValue: FilterItemsConst.muscleTypeLowerbackMiddleback,
        ),
        FilterItems(
          expandedValue: FilterItemsConst.muscleTypeNeck,
          headerValue: FilterItemsConst.muscleTypeNeck,
        ),
        FilterItems(
          expandedValue: FilterItemsConst.muscleTypeQuadriceps,
          headerValue: FilterItemsConst.muscleTypeQuadriceps,
        ),
        FilterItems(
          expandedValue: FilterItemsConst.muscleTypeTraps,
          headerValue: FilterItemsConst.muscleTypeTraps,
        ),
        FilterItems(
          expandedValue: FilterItemsConst.muscleTypeTriceps,
          headerValue: FilterItemsConst.muscleTypeTriceps,
        ),
      ],
    ),
    FilterCategory(
      headerValue: TextConstants.movesTypeText,
      expandedValue: FilterItemsConst.movesTypeExpandedValue,
      filterItemList: [
        FilterItems(
          expandedValue: FilterItemsConst.movesTypeCardio,
          headerValue: FilterItemsConst.movesTypeCardio,
        ),
        FilterItems(
          expandedValue: FilterItemsConst.movesTypeOlympicWeightlifting,
          headerValue: FilterItemsConst.movesTypeOlympicWeightlifting,
        ),
        FilterItems(
          expandedValue: FilterItemsConst.movesTypePlyometrics,
          headerValue: FilterItemsConst.movesTypePlyometrics,
        ),
        FilterItems(
          expandedValue: FilterItemsConst.movesTypePowerlifting,
          headerValue: FilterItemsConst.movesTypePowerlifting,
        ),
        FilterItems(
          expandedValue: FilterItemsConst.movesTypeStrength,
          headerValue: FilterItemsConst.movesTypeStrength,
        ),
        FilterItems(
          expandedValue: FilterItemsConst.movesTypeStretching,
          headerValue: FilterItemsConst.movesTypeStretching,
        ),
        FilterItems(
          expandedValue: FilterItemsConst.movesTypeStrongman,
          headerValue: FilterItemsConst.movesTypeStrongman,
        ),
      ],
    )
  ];

  Map<String, String> selectedFilterMap = {
    MovesServiceConst.queryParameterMuscles: '',
    MovesServiceConst.queryParameterTypes: ''
  };

  changeSelectedFilterMap({String muscle = '', String type = ''}) {
    selectedFilterMap.update(
        MovesServiceConst.queryParameterMuscles, (value) => muscle);
    selectedFilterMap.update(
        MovesServiceConst.queryParameterTypes, (value) => type);
    notifyListeners();
  }

  changeSelectedItem(FilterCategory category, int index) {
    if (category.isSelected == index) {
      category.isSelected = null;
      switch (category.expandedValue) {
        case FilterItemsConst.muscleExpandedValue:
          selectedFilterMap.update(
              MovesServiceConst.queryParameterMuscles, (value) => '');
          break;
        case FilterItemsConst.movesTypeExpandedValue:
          selectedFilterMap.update(
              MovesServiceConst.queryParameterTypes, (value) => '');
          break;
      }
    } else {
      category.isSelected = index;
      switch (category.expandedValue) {
        case FilterItemsConst.muscleExpandedValue:
          selectedFilterMap.update(MovesServiceConst.queryParameterMuscles,
              (value) => category.filterItemList[index].expandedValue);
          break;
        case FilterItemsConst.movesTypeExpandedValue:
          selectedFilterMap.update(MovesServiceConst.queryParameterTypes,
              (value) => category.filterItemList[index].expandedValue);
          break;
      }
    }
    notifyListeners();
  }

  changeExpanded(FilterCategory category, bool isExpanded) {
    category.isExpanded = !isExpanded;
    notifyListeners();
  }
}
