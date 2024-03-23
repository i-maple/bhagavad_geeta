// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getChapterHash() => r'a4baf668da734e01ec64ed971c29e3809ef0e2cc';

/// See also [getChapter].
@ProviderFor(getChapter)
final getChapterProvider = AutoDisposeFutureProvider<List<Chapter>>.internal(
  getChapter,
  name: r'getChapterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getChapterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetChapterRef = AutoDisposeFutureProviderRef<List<Chapter>>;
String _$getVerseHash() => r'4ed488c22b005811d27ca56dc743a756fd41bd44';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getVerse].
@ProviderFor(getVerse)
const getVerseProvider = GetVerseFamily();

/// See also [getVerse].
class GetVerseFamily extends Family<AsyncValue<List<Verse>>> {
  /// See also [getVerse].
  const GetVerseFamily();

  /// See also [getVerse].
  GetVerseProvider call(
    int verse,
  ) {
    return GetVerseProvider(
      verse,
    );
  }

  @override
  GetVerseProvider getProviderOverride(
    covariant GetVerseProvider provider,
  ) {
    return call(
      provider.verse,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getVerseProvider';
}

/// See also [getVerse].
class GetVerseProvider extends AutoDisposeFutureProvider<List<Verse>> {
  /// See also [getVerse].
  GetVerseProvider(
    int verse,
  ) : this._internal(
          (ref) => getVerse(
            ref as GetVerseRef,
            verse,
          ),
          from: getVerseProvider,
          name: r'getVerseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getVerseHash,
          dependencies: GetVerseFamily._dependencies,
          allTransitiveDependencies: GetVerseFamily._allTransitiveDependencies,
          verse: verse,
        );

  GetVerseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.verse,
  }) : super.internal();

  final int verse;

  @override
  Override overrideWith(
    FutureOr<List<Verse>> Function(GetVerseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetVerseProvider._internal(
        (ref) => create(ref as GetVerseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        verse: verse,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Verse>> createElement() {
    return _GetVerseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetVerseProvider && other.verse == verse;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, verse.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetVerseRef on AutoDisposeFutureProviderRef<List<Verse>> {
  /// The parameter `verse` of this provider.
  int get verse;
}

class _GetVerseProviderElement
    extends AutoDisposeFutureProviderElement<List<Verse>> with GetVerseRef {
  _GetVerseProviderElement(super.provider);

  @override
  int get verse => (origin as GetVerseProvider).verse;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
