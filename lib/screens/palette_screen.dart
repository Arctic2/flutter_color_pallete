import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/components/color_card.dart';
import 'package:surf_flutter_courses_template/models/color_dto.dart';
import 'package:surf_flutter_courses_template/data_access/i_color_repository.dart';

class PaletteScreen extends StatelessWidget {
  final IColorRepository _repository;
  const PaletteScreen({super.key, required IColorRepository repository}) : _repository = repository;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        title: SafeArea(
          child: SizedBox(
            height: 100,
            child: Text(AppStrings.title, style: theme.textTheme.bodyLarge),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
        child: FutureBuilder(
            future: _repository.getColors(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Text(AppStrings.isEmpty);
                }
                return ColorGrid(
                  colors: snapshot.data!,
                );
              } else if (snapshot.hasError) {
                return const Text(AppStrings.error);
              } else {
                return const Center(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }),
      ),
    );
  }
}

class ColorGrid extends StatelessWidget {
  final List<ColorDto> _colors;

  const ColorGrid({super.key, required List<ColorDto> colors}) : _colors = colors;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 22,
      mainAxisSpacing: 40,
      childAspectRatio: 100 / 140,
      children: [
        ..._colors.map(
          (e) => ColorCard(
            colorDto: e,
          ),
        )
      ],
    );
  }
}
