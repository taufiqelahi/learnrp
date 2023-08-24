// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_items_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$testHandlerHash() => r'3be08241a37ec2a6a50475a98b2844fc9140fbcb';

/// See also [testHandler].
@ProviderFor(testHandler)
final testHandlerProvider = AutoDisposeFutureProvider<String>.internal(
  testHandler,
  name: r'testHandlerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$testHandlerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TestHandlerRef = AutoDisposeFutureProviderRef<String>;
String _$cHash() => r'33db5b1f27997ac9c4341157b400e60026073e67';

/// See also [c].
@ProviderFor(c)
final cProvider = AutoDisposeProvider<int>.internal(
  c,
  name: r'cProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CRef = AutoDisposeProviderRef<int>;
String _$cartItemsHandlerHash() => r'a7d08e5825a5f5aca687a3d26aa63952f3ff9a1c';

/// See also [CartItemsHandler].
@ProviderFor(CartItemsHandler)
final cartItemsHandlerProvider =
    AutoDisposeNotifierProvider<CartItemsHandler, List<Product>>.internal(
  CartItemsHandler.new,
  name: r'cartItemsHandlerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cartItemsHandlerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CartItemsHandler = AutoDisposeNotifier<List<Product>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
