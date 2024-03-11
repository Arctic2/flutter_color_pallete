import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaletteScreen extends StatelessWidget {
  const PaletteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
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
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 22,
          mainAxisSpacing: 40,
          childAspectRatio: 100 / 140,
          children: List.generate(
            20,
            (index) => Container(
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
