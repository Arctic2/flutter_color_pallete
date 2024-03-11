import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/DataAccess/mock_color_repository.dart';
import 'package:surf_flutter_courses_template/screens/palette_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var repo = MockColorRepository();

    return MaterialApp(
      home: PaletteScreen(
        repository: repo,
      ),
    );
  }
}
