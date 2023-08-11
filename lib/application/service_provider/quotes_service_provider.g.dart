// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCompleteQuotesHash() => r'6e62da6a604e1b251bea8c43deea6b33c217bc16';

/// See also [getCompleteQuotes].
@ProviderFor(getCompleteQuotes)
final getCompleteQuotesProvider = AutoDisposeProvider<List<Quote>>.internal(
  getCompleteQuotes,
  name: r'getCompleteQuotesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCompleteQuotesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCompleteQuotesRef = AutoDisposeProviderRef<List<Quote>>;
String _$initialQuoteHash() => r'321a116008b33413be1cb79ef290f52c7544ae1c';

/// See also [initialQuote].
@ProviderFor(initialQuote)
final initialQuoteProvider = AutoDisposeFutureProvider<List<Quote>>.internal(
  initialQuote,
  name: r'initialQuoteProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$initialQuoteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef InitialQuoteRef = AutoDisposeFutureProviderRef<List<Quote>>;
String _$likeHash() => r'559248e54679a114960ced2b8bf6dede6c0b13f1';

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

typedef LikeRef = AutoDisposeFutureProviderRef<void>;

/// See also [like].
@ProviderFor(like)
const likeProvider = LikeFamily();

/// See also [like].
class LikeFamily extends Family<AsyncValue<void>> {
  /// See also [like].
  const LikeFamily();

  /// See also [like].
  LikeProvider call(
    Quote quote,
  ) {
    return LikeProvider(
      quote,
    );
  }

  @override
  LikeProvider getProviderOverride(
    covariant LikeProvider provider,
  ) {
    return call(
      provider.quote,
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
  String? get name => r'likeProvider';
}

/// See also [like].
class LikeProvider extends AutoDisposeFutureProvider<void> {
  /// See also [like].
  LikeProvider(
    this.quote,
  ) : super.internal(
          (ref) => like(
            ref,
            quote,
          ),
          from: likeProvider,
          name: r'likeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$likeHash,
          dependencies: LikeFamily._dependencies,
          allTransitiveDependencies: LikeFamily._allTransitiveDependencies,
        );

  final Quote quote;

  @override
  bool operator ==(Object other) {
    return other is LikeProvider && other.quote == quote;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quote.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
