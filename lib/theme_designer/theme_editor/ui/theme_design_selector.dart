import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/string_ext.dart';
import '../../theme_state.dart';
import '../state_management/theme_states.dart';

class ThemeDesignSelector extends ConsumerWidget {
  const ThemeDesignSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeDesignState);
    return DropdownButtonHideUnderline(
      child: DropdownButton<ThemeDesign>(
        value: theme,
        onChanged: (value) {
          final data = value ?? theme;
          ref.read(themeDesignState.notifier).update((x) => data);
          ref.read(themeState.notifier).update((x) => data.theme);
        },
        padding: const EdgeInsets.only(left: 8),
        items: ThemeDesign.values
            .map(
              (e) => DropdownMenuItem<ThemeDesign>(
                value: e,
                child: Text(e.name.toEnumName),
              ),
            )
            .toList(),
      ),
    );
  }
}
