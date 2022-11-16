import 'package:flutter/material.dart';
import 'package:moves_app_for_job/core/constants/padding_const.dart';
import 'package:moves_app_for_job/core/provider/search_filter_provider.dart';
import 'package:moves_app_for_job/features/pages/home_page/view_model/home_page_view_model.dart';
import 'package:moves_app_for_job/product/constants/text_constants.dart';
import 'package:moves_app_for_job/product/services/move_service/move_service_const.dart';
import 'package:provider/provider.dart';

import '../../../../product/widgets/expansion_list.dart';
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
      backgroundColor: Colors.grey,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            backgroundColor: Colors.grey,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const PaddingConst.mediumHorizontalSymmetric(),
              title: Row(
                children: [
                  Expanded(
                    child: SearchBar(
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
                      final Map filtered = await showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => Padding(
                          padding: const PaddingConst.mediumAll(),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      TextConstants.filterBackButtonText,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(context
                                          .read<SearchFilterProvider>()
                                          .selectedFilterMap);
                                    },
                                    child: const Text(
                                      TextConstants.filterSaveButtonText,
                                    ),
                                  ),
                                ],
                              ),
                              const ExpansionListItem(),
                            ],
                          ),
                        ),
                      );

                      searchMoves(
                        name: searchedName,
                        muscle:
                            filtered[MovesServiceConst.queryParameterMuscles],
                        type: filtered[MovesServiceConst.queryParameterTypes],
                      );
                    },
                    splashRadius: 24,
                    tooltip: TextConstants.filterText,
                    icon: const Icon(
                      Icons.list,
                      color: Colors.white,
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
                        '${movesList != null ? movesList!.length : '0'} results found.'),
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
