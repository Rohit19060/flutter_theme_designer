import 'package:flutter_riverpod/legacy.dart';

enum InfoView { devicePreview, codeView }

final infoViewState = StateProvider<InfoView>((ref) => InfoView.values.first);

T invert<T>(T value, List<T> values) {
  final index = values.indexOf(value);
  return values[(index + 1) % values.length];
}
