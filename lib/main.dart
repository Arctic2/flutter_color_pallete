import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/data_access/i_color_repository.dart';
import 'package:surf_flutter_courses_template/data_access/mock_color_repository.dart';
import 'package:surf_flutter_courses_template/screens/palette_screen.dart';
import 'package:surf_flutter_courses_template/theme.dart';

void main() {
  var repo = MockColorRepository();
  runApp(MainApp(repo: repo));
}

class MainApp extends StatelessWidget {
  final IColorRepository _repo;
  const MainApp({super.key, required IColorRepository repo}) : _repo = repo;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: PaletteScreen(
        repository: _repo,
      ),
    );
  }
}
