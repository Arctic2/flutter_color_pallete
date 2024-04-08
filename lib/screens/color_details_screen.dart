import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/components/details_button.dart';
import 'package:surf_flutter_courses_template/models/color_dto.dart';
import 'package:surf_flutter_courses_template/utils/copy_helper.dart';
import 'package:surf_flutter_courses_template/utils/hex_color.dart';

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
                  await CopyHelper.copyWitchSnackbar(context, _colorDto.hex, AppStrings.hexCopied);
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
                      await CopyHelper.copyWitchSnackbar(context, color.red.toString(), AppStrings.redCopied);
                    },
                  ),
                  DetailButton(
                    child: Text("Green ${color.green}"),
                    onPressed: () async {
                      await CopyHelper.copyWitchSnackbar(context, color.green.toString(), AppStrings.greenCopied);
                    },
                  ),
                  DetailButton(
                    child: Text("Blue ${color.blue}"),
                    onPressed: () async {
                      await CopyHelper.copyWitchSnackbar(context, color.blue.toString(), AppStrings.blueCopied);
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
}
