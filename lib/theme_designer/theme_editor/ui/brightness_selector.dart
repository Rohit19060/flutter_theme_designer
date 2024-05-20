import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state_management/theme_states.dart';

class BrightnessSelector extends ConsumerWidget {
  const BrightnessSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Switch.adaptive(
      value: theme.brightness == Brightness.dark,
      onChanged: (value) {
        if (value) {
          ref
              .read(themeState.notifier)
              .update((x) => x.copyWith(brightness: Brightness.dark));
        } else {
          ref
              .read(themeState.notifier)
              .update((x) => x.copyWith(brightness: Brightness.light));
        }
      },
    );
  }
}
