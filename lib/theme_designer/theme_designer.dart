import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../code_preview.dart';
import 'device_view.dart';
import 'theme_editor/state_management/theme_states.dart';
import 'theme_editor/ui/theme_editor.dart';
import 'theme_primary_providers.dart';
import 'theme_state.dart';

class ThemeDesigner extends ConsumerWidget {
  const ThemeDesigner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeState);
    return MaterialApp(
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: const Text('Theme Designer', style: TextStyle(fontSize: 30)),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                ref.invalidate(themeState);
                ref.invalidate(themeDesignState);
              },
            ),
          ],
        ),
        body: Row(
          children: [
            const Expanded(
              child: Column(
                children: [
                  Center(child: Text('Theme Editor', style: TextStyle(fontSize: 24))),
                  Expanded(child: ThemeEditor()),
                ],
              ),
            ),
            const VerticalDivider(width: 1),
            Expanded(
              child: Consumer(builder: (context, ref, child) {
                final view = ref.watch(infoViewState);
                return Column(
                  children: [
                    const Center(child: Text('Theme Preview', style: TextStyle(fontSize: 24))),
                    const SizedBox(height: 6),
                    Expanded(
                        child: switch (view) {
                      InfoView.devicePreview => const DeviceView(),
                      InfoView.codeView => CodePreview(str: CustomThemeData(theme).toString()),
                    }),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
