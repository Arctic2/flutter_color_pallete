import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:surf_flutter_courses_template/DataAccess/i_color_repository.dart';
import 'package:surf_flutter_courses_template/Models/color_dto.dart';

class MockColorRepository implements IColorRepository {
  ColorsData? _colorsData;

  @override
  Future<List<ColorDto>> getColors() async {
    if (_colorsData == null) {
      var str = await loadJson();
      var jsonDecoded = jsonDecode(str);
      _colorsData = ColorsData.fromJson(jsonDecoded);
    }

    await Future.delayed(const Duration(seconds: 3));

    return _colorsData!.colors;
  }

  Future<String> loadJson() async {
    return await rootBundle.loadString('assets/colors.json');
  }
}
