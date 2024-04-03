import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyHelper {
  static Future<void> copyWitchSnackbar(BuildContext context, String value, String snackBarText) async {
    final theme = Theme.of(context);

    await Clipboard.setData(ClipboardData(text: value)).then((value) {
      final snackBar = SnackBar(
        duration: const Duration(milliseconds: 1000),
        width: 173,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: SizedBox(
          height: 64,
          child: Center(
              child: Text(
            snackBarText,
            style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white),
          )),
        ),
        behavior: SnackBarBehavior.floating,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
