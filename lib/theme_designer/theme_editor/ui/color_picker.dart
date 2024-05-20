import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget({super.key, required this.color, required this.onColorChanged});
  final Color color;
  final void Function(Color) onColorChanged;

  @override
  Widget build(BuildContext context) => ColorPicker(
      color: color,
      borderRadius: 4,
      showColorCode: true,
      onColorChanged: onColorChanged,
      pickersEnabled: const {
        ColorPickerType.primary: false,
        ColorPickerType.accent: false,
        ColorPickerType.bw: false,
        ColorPickerType.wheel: true,
        ColorPickerType.both: true,
      },
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        copyFormat: ColorPickerCopyFormat.numHexRRGGBB,
        snackBarParseError: true,
        snackBarMessage:
            "Invalid color code, please ensure that it's RGB format with "
            "leading # sign and no alpha '#RRGGBB'",
      ),
    );
}
