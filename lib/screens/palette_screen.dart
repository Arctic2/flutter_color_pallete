import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surf_flutter_courses_template/DataAccess/i_color_repository.dart';
import 'package:surf_flutter_courses_template/Models/color_dto.dart';
import 'package:surf_flutter_courses_template/Utils/hex_color.dart';

class PaletteScreen extends StatelessWidget {
  IColorRepository _repository;
  PaletteScreen({Key? key, required IColorRepository repository}) : _repository = repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        title: SafeArea(
          child: SizedBox(
            height: 100,
            child: Text(
              "Эксклюзивная палитра\n«Colored Box»",
              style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: const Color(0xFF252838),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: FutureBuilder(
            future: _repository.getColors(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return Text('Не найдено ни одного цвета');
                }
                return ColorGrid(
                  colors: snapshot.data!,
                );
              } else if (snapshot.hasError) {
                return Text('Error');
              } else {
                return Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(),
                    width: 60,
                    height: 60,
                  ),
                );
              }
            }),
      ),
    );
  }
}

class ColorGrid extends StatelessWidget {
  List<ColorDto> _colors;

  ColorGrid({Key? key, required List<ColorDto> colors}) : _colors = colors;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 22,
        mainAxisSpacing: 40,
        childAspectRatio: 100 / 140,
        children: [
          ..._colors.map((e) => Container(
                height: 140,
                width: 100,
                color: HexColor.fromHex(e.hex),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(e.name),
                ),
              ))
        ]);
  }
}
