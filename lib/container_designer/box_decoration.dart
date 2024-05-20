import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme_designer/theme_editor/ui/color_editor.dart';
import 'container_states.dart';

class BoxDecorationDesigner extends ConsumerWidget {
  const BoxDecorationDesigner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Expanded(
        child: ListView(
          children: [
            const Text('Color'),
            ColorEditor(
              label: 'Color',
              color: (ref.watch(decorationNotifierProvider) as BoxDecoration).color ?? Colors.transparent,
              onColorChanged: (value) => ref.read(decorationNotifierProvider.notifier).updateColor(value),
            ),
            const Text('Border Width'),
            Slider(
              value: (((ref.watch(decorationNotifierProvider) as BoxDecoration).border ?? Border.all(width: 0)) as Border).bottom.width,
              onChanged: (value) => ref.read(decorationNotifierProvider.notifier).updateBorderWidth(value),
              max: 100,
              divisions: 100,
            ),
            const Text('Border Radius'),
            Slider(
              value: (((ref.watch(decorationNotifierProvider) as BoxDecoration).borderRadius ?? BorderRadius.zero) as BorderRadius).bottomLeft.x,
              onChanged: (value) => ref.read(decorationNotifierProvider.notifier).updateBorderRadius(value),
              max: 100,
              divisions: 100,
            ),
            ColorEditor(
              label: 'Border Color',
              color: (((ref.watch(decorationNotifierProvider) as BoxDecoration).border ?? Border.all(width: 0)) as Border).bottom.color,
              onColorChanged: (value) => ref.read(decorationNotifierProvider.notifier).updateBorderColor(value),
            ),
          ],
        ),
      );
}
