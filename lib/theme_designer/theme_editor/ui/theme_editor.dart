import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state_management/theme_states.dart';
import 'color_editor.dart';
import 'theme_design_selector.dart';

class ThemeEditor extends ConsumerWidget {
  const ThemeEditor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeState);
    return Row(
      children: [
        Expanded(
          child: ListView(
            children: [
              const SizedBox(height: 6),
              const ThemeDesignSelector(),
              ColorEditor(
                label: 'Primary Color',
                color: theme.primaryColor,
                onColorChanged: (color) {
                  ref
                      .read(themeState.notifier)
                      .update((x) => x.copyWith(primaryColor: color));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
