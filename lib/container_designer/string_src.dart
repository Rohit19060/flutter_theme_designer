import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'container_states.dart';

part 'string_src.g.dart';

@riverpod
class StringSrcNotifier extends _$StringSrcNotifier {
  @override
  String build() {
    final decor = ref.watch(decorationNotifierProvider);
    final width = ref.watch(containerWidthState);
    final height = ref.watch(containerHeightState);

    final str = StringBuffer();
    str.writeln('Container(');
    str.writeln('  width: $width,');
    str.writeln('  height: $height,');
    str.writeln('  decoration: $decor,');
    str.writeln('  child: const SizedBox.expand(),');
    str.writeln(')');

    return str.toString();
  }
}
