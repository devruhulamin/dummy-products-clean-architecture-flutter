import 'dart:async';

import 'package:dummy_product/domain/entities/product.dart';
import 'package:dummy_product/presentation/providers/product_repo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsNotifierProvider =
    AsyncNotifierProvider<ProductsNotifier, List<Product>>(
  () => ProductsNotifier(),
);

class ProductsNotifier extends AsyncNotifier<List<Product>> {
  int _skip = 0;
  bool _hasNext = true;

  @override
  FutureOr<List<Product>> build() {
    return _fetchInitialProducts();
  }

  Future<List<Product>> _fetchInitialProducts() async {
    final productsRepo = ref.read(productRepoProvider);
    _skip = 0;
    _hasNext = true;
    return productsRepo.fetchProducts(skip: _skip);
  }

  Future<void> loadMoreProducts() async {
    if (!_hasNext || state.isLoading || state is AsyncLoading) return;

    try {
      final previous = state.value ?? [];

      final productsRepo = ref.read(productRepoProvider);
      _skip += 10;

      final newProducts = await productsRepo.fetchProducts(skip: _skip);
      if (newProducts.isEmpty) {
        _hasNext = false;
        return;
      }
      state = AsyncValue.data([...previous, ...newProducts]);
    } catch (e, trace) {
      state = AsyncValue.error(e, trace);
    }
  }

  Future<void> refreshProducts() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchInitialProducts());
  }
}
