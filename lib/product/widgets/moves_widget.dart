import 'package:flutter/material.dart';

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
      child: Card(
        child: Padding(
          padding: const PaddingConst.mediumAll(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movesModel.name),
              Padding(
                padding: const PaddingConst.mediumVerticalSymmetric(),
                child: Container(
                  color: Colors.grey,
                  child: Padding(
                    padding: const PaddingConst.mediumAll(),
                    child: Text(movesModel.type),
                  ),
                ),
              ),
              Text(movesModel.muscle)
            ],
          ),
        ),
      ),
    );
  }
}
