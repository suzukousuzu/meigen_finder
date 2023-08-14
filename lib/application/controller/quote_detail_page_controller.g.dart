// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_detail_page_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$quoteDetailControllerHash() =>
    r'ba55f965188a796956e2cf088fc4da75cea88f81';

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

abstract class _$QuoteDetailController
    extends BuildlessAutoDisposeNotifier<QuoteDetailPageViewState> {
  late final QuoteDetailArgument quoteDetailArgument;

  QuoteDetailPageViewState build(
    QuoteDetailArgument quoteDetailArgument,
  );
}

/// See also [QuoteDetailController].
@ProviderFor(QuoteDetailController)
const quoteDetailControllerProvider = QuoteDetailControllerFamily();

/// See also [QuoteDetailController].
class QuoteDetailControllerFamily extends Family<QuoteDetailPageViewState> {
  /// See also [QuoteDetailController].
  const QuoteDetailControllerFamily();

  /// See also [QuoteDetailController].
  QuoteDetailControllerProvider call(
    QuoteDetailArgument quoteDetailArgument,
  ) {
    return QuoteDetailControllerProvider(
      quoteDetailArgument,
    );
  }

  @override
  QuoteDetailControllerProvider getProviderOverride(
    covariant QuoteDetailControllerProvider provider,
  ) {
    return call(
      provider.quoteDetailArgument,
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
  String? get name => r'quoteDetailControllerProvider';
}

/// See also [QuoteDetailController].
class QuoteDetailControllerProvider extends AutoDisposeNotifierProviderImpl<
    QuoteDetailController, QuoteDetailPageViewState> {
  /// See also [QuoteDetailController].
  QuoteDetailControllerProvider(
    this.quoteDetailArgument,
  ) : super.internal(
          () => QuoteDetailController()
            ..quoteDetailArgument = quoteDetailArgument,
          from: quoteDetailControllerProvider,
          name: r'quoteDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$quoteDetailControllerHash,
          dependencies: QuoteDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              QuoteDetailControllerFamily._allTransitiveDependencies,
        );

  final QuoteDetailArgument quoteDetailArgument;

  @override
  bool operator ==(Object other) {
    return other is QuoteDetailControllerProvider &&
        other.quoteDetailArgument == quoteDetailArgument;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quoteDetailArgument.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  QuoteDetailPageViewState runNotifierBuild(
    covariant QuoteDetailController notifier,
  ) {
    return notifier.build(
      quoteDetailArgument,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
