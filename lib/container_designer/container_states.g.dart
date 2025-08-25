// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'container_states.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(DecorationNotifier)
const decorationNotifierProvider = DecorationNotifierProvider._();

final class DecorationNotifierProvider
    extends $NotifierProvider<DecorationNotifier, Decoration> {
  const DecorationNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'decorationNotifierProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$decorationNotifierHash();

  @$internal
  @override
  DecorationNotifier create() => DecorationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Decoration value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Decoration>(value),
    );
  }
}

String _$decorationNotifierHash() =>
    r'1ce2ef2e543f9e7558a944cd3fbf7ac65398576a';

abstract class _$DecorationNotifier extends $Notifier<Decoration> {
  Decoration build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Decoration, Decoration>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<Decoration, Decoration>, Decoration, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
