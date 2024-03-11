import 'package:surf_flutter_courses_template/Models/color_dto.dart';

abstract class IColorRepository {
  Future<List<ColorDto>> getColors();
}
