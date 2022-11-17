import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:moves_app_for_job/core/mixin/loading_mixin.dart';
import 'package:moves_app_for_job/product/constants/color_constants.dart';
import 'package:moves_app_for_job/product/models/moves_model/moves_model.dart';
import 'package:moves_app_for_job/product/services/move_service/move_service.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/padding_const.dart';
import '../../../../core/provider/search_filter_provider.dart';
import '../../../../product/constants/text_constants.dart';
import '../../../../product/widgets/custom_text_button.dart';
import '../../../../product/widgets/expansion_list.dart';
import '../view/home_page_view.dart';

abstract class HomePageViewModel extends State<HomePageView> with LoadingMixin {
  late MovesService movesService;

  List<MovesModel>? movesList;

  String searchedName = '';

  late final TextEditingController searchBarController;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    movesService = MovesService.instance;
    searchBarController = TextEditingController();
  }

  searchMoves(
      {required String name, String muscle = '', String type = ''}) async {
    changeLoading();
    movesList = await movesService.fetchSearchedMoves(
        name: name, muscle: muscle, type: type);
    changeLoading();
  }

  Future<dynamic> showFilterSheet() {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: ColorConst.lightCyan,
      context: context,
      builder: (context) => Padding(
        padding: const PaddingConst.mediumAll(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    text: TextConstants.filterBackButtonText,
                    textStyle: context.textTheme.headline6),
                CustomTextButton(
                    onPressed: () {
                      Navigator.of(context).pop(context
                          .read<SearchFilterProvider>()
                          .selectedFilterMap);
                    },
                    text: TextConstants.filterSaveButtonText,
                    textStyle: context.textTheme.headline6),
              ],
            ),
            const ExpansionListItem(),
          ],
        ),
      ),
    );
  }
}
