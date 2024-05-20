import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({super.key, required this.value, required this.onChanged, required this.label});
  final bool value;
  final String label;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(child:   Text(label)),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
          ),
        ],
      );
}
