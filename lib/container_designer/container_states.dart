import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'container_states.g.dart';

final containerHeightState = StateProvider<double>((ref) => 100);
final containerWidthState = StateProvider<double>((ref) => 100);
final containerRadiusState = StateProvider<double>((ref) => 0);
final decorationType = StateProvider<Decoration>((ref) => const BoxDecoration());

@riverpod
class DecorationNotifier extends _$DecorationNotifier {
  @override
  Decoration build() {
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    final radius = ref.watch(containerRadiusState);
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    switch (ref.watch(decorationType)) {
      case const BoxDecoration():
        return BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(radius),
        );
      case ShapeDecoration():
        return ShapeDecoration(
          color: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        );
    }
    return BoxDecoration(borderRadius: BorderRadius.circular(radius));
  }

  void updateColor(Color value) {
    final currentDecoration = state as BoxDecoration;
    state = currentDecoration.copyWith(color: value);
  }

  void updateBorderWidth(double value) {
    final currentDecoration = state as BoxDecoration;
    final previousBorder = currentDecoration.border ?? Border.all(width: 0);
    state = currentDecoration
        .copyWith(border: currentDecoration.border ?? Border.all(width: 0))
        .copyWith(border: Border.all(width: value, color: previousBorder.bottom.color));
  }

  void updateBorderRadius(double value) {
    final currentDecoration = state as BoxDecoration;
    state = currentDecoration.copyWith(borderRadius: BorderRadius.circular(value));
  }

  void updateBorderColor(Color value) {
    final currentDecoration = state as BoxDecoration;
    final previousBorder = currentDecoration.border ?? Border.all(width: 0);
    state = currentDecoration
        .copyWith(border: currentDecoration.border ?? Border.all(width: 0))
        .copyWith(border: Border.all(color: value, width: previousBorder.bottom.width));
  }
}
