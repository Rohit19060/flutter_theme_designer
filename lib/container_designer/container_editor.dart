import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'box_decoration.dart';
import 'container_states.dart';
import 'shape_decoration.dart';

class ContainerEditor extends ConsumerWidget {
  const ContainerEditor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
        children: [
          const Text('Container Height'),
          Slider(
            value: ref.watch(containerHeightState),
            onChanged: (value) => ref.read(containerHeightState.notifier).update((x) => value),
            max: 500,
            divisions: 500,
          ),
          const Text('Container Width'),
          Slider(
            value: ref.watch(containerWidthState),
            onChanged: (value) => ref.read(containerWidthState.notifier).update((x) => value),
            max: 500,
            divisions: 500,
          ),
          const Text('Decoration Type'),
          DropdownButtonHideUnderline(
            child: DropdownButton<Decoration>(
              value: ref.watch(decorationType),
              onChanged: (value) => ref.read(decorationType.notifier).update((x) => value ?? const BoxDecoration()),
              items: const [
                DropdownMenuItem(
                  value: BoxDecoration(),
                  child: Text('Box Decoration'),
                ),
                DropdownMenuItem(
                  value: ShapeDecoration(shape: RoundedRectangleBorder()),
                  child: Text('Shape Decoration'),
                ),
              ],
            ),
          ),
          switch (ref.watch(decorationType)) {
            BoxDecoration() => const BoxDecorationDesigner(),
            ShapeDecoration() => const ShapeDecorationDesigner(),
            _ => const Text('Unknown'),
          }
        ],
      );
}
