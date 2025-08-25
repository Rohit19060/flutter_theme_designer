// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'string_src.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(StringSrcNotifier)
const stringSrcNotifierProvider = StringSrcNotifierProvider._();

final class StringSrcNotifierProvider
    extends $NotifierProvider<StringSrcNotifier, String> {
  const StringSrcNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'stringSrcNotifierProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$stringSrcNotifierHash();

  @$internal
  @override
  StringSrcNotifier create() => StringSrcNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$stringSrcNotifierHash() => r'6e0b8a6b98a08ba9393dabef9556b5d879639342';

abstract class _$StringSrcNotifier extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String, String>, String, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
