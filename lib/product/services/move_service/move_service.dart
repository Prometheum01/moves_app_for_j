import 'dart:io';

import 'package:dio/dio.dart';
import 'package:moves_app_for_job/product/models/moves_model/moves_model.dart';
import 'package:moves_app_for_job/product/services/move_service/move_service_const.dart';

class Singleton {
  static Singleton? _instance;

  Singleton._();

  static Singleton get instance => _instance ??= Singleton._();

  void someMethod() {}
}

class MovesService {
  static MovesService? _instance;

  MovesService._();

  static MovesService get instance => _instance ??= MovesService._();

  final Dio dio = Dio();

  Future<List<MovesModel>?> fetchSearchedMoves(
      {required String name, String muscle = '', String type = ''}) async {
    final response = await dio.get(
      MovesServiceConst.mainPath,
      queryParameters: {
        MovesServiceConst.queryParameterName: name,
        MovesServiceConst.queryParameterMuscles: muscle,
        MovesServiceConst.queryParameterTypes: type,
      },
      options: Options(
        headers: {
          MovesServiceConst.headerKey: MovesServiceConst.headerKeyValue,
          MovesServiceConst.headerHost: MovesServiceConst.headerHostValue,
        },
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      if (response.data != null) {
        final json = response.data as List;

        return json.map((e) => MovesModel.fromJson(e)).toList();
      }
    }
    return null;
  }
}
