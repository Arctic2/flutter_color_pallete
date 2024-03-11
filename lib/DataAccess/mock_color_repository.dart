import 'package:surf_flutter_courses_template/DataAccess/i_color_repository.dart';
import 'package:surf_flutter_courses_template/Models/color_dto.dart';

class MockColorRepository implements IColorRepository {
  final List<ColorDto> _colors = [
    ColorDto("fucsia", "ff00ff"),
    ColorDto("inv", "00ff00"),
    ColorDto("gray", "808080"),
    ColorDto("orange", "ff9505"),
    ColorDto("bronze", "ffdae9"),
    ColorDto("dark", "010203"),
    ColorDto("FFBE", "00ffbe"),
  ];

  @override
  Future<List<ColorDto>> getColors() async {
    await Future.delayed(const Duration(seconds: 3));
    // throw Exception();
    return _colors;
  }
}
