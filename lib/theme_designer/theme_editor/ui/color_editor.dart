import 'package:flutter/material.dart';

import 'color_picker.dart';

class ColorEditor extends StatelessWidget {
  const ColorEditor({
    super.key,
    required this.color,
    required this.onColorChanged,
    required this.label,
  });
  final Color color;
  final String label;
  final void Function(Color) onColorChanged;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () async {
            await showDialog<Color>(
              context: context,
              builder: (context) => AlertDialog(
                content: ConstrainedBox(
                  constraints: const BoxConstraints(
                      maxWidth: 400,
                      maxHeight: 450,
                      minHeight: 450,
                      minWidth: 400),
                  child: ColorPickerWidget(
                      color: color, onColorChanged: onColorChanged),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(color),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
          child: Row(
            children: [
              const SizedBox(width: 6),
              Expanded(
                  child: Text(label,
                      style: Theme.of(context).textTheme.titleLarge)),
              const SizedBox(width: 6),
              ColorContainer(color: color),
            ],
          ),
        ),
      );
}

class ColorContainer extends StatelessWidget {
  const ColorContainer({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        width: 40,
        height: 40,
        color: color,
      );
}
