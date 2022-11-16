import 'package:flutter/material.dart';
import 'package:moves_app_for_job/core/mixin/loading_mixin.dart';
import 'package:moves_app_for_job/product/models/moves_model/moves_model.dart';
import 'package:moves_app_for_job/product/services/move_service/move_service.dart';

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
    movesService = MovesService();
    searchBarController = TextEditingController();
  }

  searchMoves(
      {required String name, String muscle = '', String type = ''}) async {
    changeLoading();
    movesList = await movesService.fetchSearchedMoves(
        name: name, muscle: muscle, type: type);
    changeLoading();
  }
}
