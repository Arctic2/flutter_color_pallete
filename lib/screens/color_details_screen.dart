import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surf_flutter_courses_template/Components/details_button.dart';
import 'package:surf_flutter_courses_template/Models/color_dto.dart';
import 'package:surf_flutter_courses_template/Utils/copy_helper.dart';
import 'package:surf_flutter_courses_template/Utils/hex_color.dart';

class ColorDetailsScreen extends StatelessWidget {
  final ColorDto _colorDto;

  const ColorDetailsScreen({super.key, required ColorDto colorDto}) : _colorDto = colorDto;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var color = HexColor.fromHex(_colorDto.hex);
    var theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(children: [
        Hero(
          tag: _colorDto.hex,
          child: Container(
            height: height / 2,
            width: double.infinity,
            color: color,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _colorDto.name,
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 16,
              ),
              DetailButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Hex"),
                    Text(_colorDto.hex),
                  ],
                ),
                onPressed: () async {
                  await CopyHelper.copyWitchSnackbar(context, _colorDto.hex, "Hex скопирован");
                  // Clipboard.setData(ClipboardData(text: "${_colorDto.hex}"));
                  // // copied successfully

                  // final snackBar = snackBarCall("Hex");

                  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DetailButton(
                    child: Text("Red ${color.red}"),
                    onPressed: () async {
                      await CopyHelper.copyWitchSnackbar(context, color.red.toString(), "Red скопирован");
                      // Clipboard.setData(ClipboardData(text: "${color.red}"));
                      // // copied successfully
                      // final snackBar = snackBarCall("Red");

                      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  ),
                  DetailButton(
                    child: Text("Green ${color.green}"),
                    onPressed: () async {
                      await CopyHelper.copyWitchSnackbar(context, color.green.toString(), "Green скопирован");
                      // Clipboard.setData(ClipboardData(text: "${color.green}"));
                      // copied successfully
                      // final snackBar = snackBarCall("Green");

                      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  ),
                  DetailButton(
                    child: Text("Blue ${color.blue}"),
                    onPressed: () async {
                      await CopyHelper.copyWitchSnackbar(context, color.blue.toString(), "Blue скопирован");
                      // Clipboard.setData(ClipboardData(text: "${color.blue}"));
                      // // copied successfully
                      // final snackBar = snackBarCall("Blue");

                      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }

  snackBarCall(String data) {
    return SnackBar(
      content: Center(
        child: Text("$data скопирован"),
      ),
      duration: const Duration(milliseconds: 1500),
      width: 280.0, // Width of the SnackBar.
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0, // Inner padding for SnackBar content.
        vertical: 15.0,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
