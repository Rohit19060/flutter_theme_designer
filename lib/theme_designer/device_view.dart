import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'output_elements.dart';
import 'theme_editor/state_management/theme_states.dart';

class DeviceView extends ConsumerWidget {
  const DeviceView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => DevicePreview(
      builder: (context) => MaterialApp(
        // ignore: deprecated_member_use
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
          theme: ref.watch(themeState),
        home: const OutputElements(),
      ),
      );
}
