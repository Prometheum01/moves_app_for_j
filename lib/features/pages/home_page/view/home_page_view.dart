import 'package:flutter/material.dart';
import 'package:moves_app_for_job/core/constants/padding_const.dart';
import 'package:moves_app_for_job/features/pages/home_page/view_model/home_page_view_model.dart';
import 'package:moves_app_for_job/product/constants/color_constants.dart';
import 'package:moves_app_for_job/product/constants/text_constants.dart';
import 'package:moves_app_for_job/product/services/move_service/move_service_const.dart';

import '../../../../product/widgets/moves_widget.dart';
import '../../../../product/widgets/search_bar.dart';

import 'package:kartal/kartal.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends HomePageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const PaddingConst.mediumHorizontalSymmetric(),
              title: Row(
                children: [
                  Expanded(
                    child: SearchBar(
                      textStyle: context.textTheme.headline6
                          ?.copyWith(color: ColorConst.skyBlueCrayola),
                      controller: searchBarController,
                      search: (name) {
                        setState(() {
                          searchedName = name;
                        });
                        searchMoves(name: name);
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      final Map filtered = await showFilterSheet();

                      searchMoves(
                        name: searchedName,
                        muscle:
                            filtered[MovesServiceConst.queryParameterMuscles],
                        type: filtered[MovesServiceConst.queryParameterTypes],
                      );
                    },
                    splashRadius: 24,
                    splashColor: ColorConst.skyBlueCrayola,
                    tooltip: TextConstants.filterText,
                    icon: const Icon(
                      Icons.list,
                      color: ColorConst.skyBlueCrayola,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: context.dynamicHeight(0.075),
              child: Center(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        '${movesList != null ? movesList!.length : '0'} ${TextConstants.resultFoundText}',
                        style: context.textTheme.headline6
                            ?.copyWith(color: ColorConst.skyBlueCrayola),
                      ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return MovesWidget(movesModel: movesList![index]);
              },
              childCount: movesList?.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
