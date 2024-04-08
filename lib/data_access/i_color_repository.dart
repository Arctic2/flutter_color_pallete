import 'package:surf_flutter_courses_template/models/color_dto.dart';

abstract class IColorRepository {
  Future<List<ColorDto>> getColors();
}
