import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:moves_app_for_job/core/constants/radius_const.dart';
import 'package:moves_app_for_job/product/constants/color_constants.dart';
import 'package:moves_app_for_job/product/constants/text_constants.dart';

import '../../core/constants/custom_box_decoration.dart';
import '../../core/constants/padding_const.dart';
import '../models/moves_model/moves_model.dart';

class MovesWidget extends StatelessWidget {
  const MovesWidget({
    Key? key,
    required this.movesModel,
  }) : super(key: key);

  final MovesModel movesModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PaddingConst.mediumAll(),
      child: Container(
        decoration: const CustomBoxDecoration.movesContainer(
          ColorConst.blizzardBlue,
          RadiusConst.largeAll(),
        ),
        child: Padding(
          padding: const PaddingConst.mediumAll() * 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${TextConstants.movesNameText}: ${movesModel.name}',
                style: context.textTheme.headline6
                    ?.copyWith(color: ColorConst.skyBlueCrayola, fontSize: 16),
              ),
              Padding(
                padding: const PaddingConst.mediumVerticalSymmetric(),
                child: Container(
                  decoration: const CustomBoxDecoration.movesContainer(
                      ColorConst.lightCyan, RadiusConst.smallAll()),
                  child: Padding(
                    padding: const PaddingConst.mediumAll(),
                    child: Text(
                      '${TextConstants.movesTypeText}: ${movesModel.type}',
                      style: context.textTheme.headline6?.copyWith(
                          color: ColorConst.skyBlueCrayola, fontSize: 16),
                    ),
                  ),
                ),
              ),
              Text(
                '${TextConstants.musclesTypeText}: ${movesModel.muscle}',
                style: context.textTheme.headline6
                    ?.copyWith(color: ColorConst.skyBlueCrayola, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
