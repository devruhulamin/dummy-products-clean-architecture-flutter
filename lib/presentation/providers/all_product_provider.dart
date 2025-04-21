import 'package:dummy_product/domain/entities/product.dart';
import 'package:dummy_product/presentation/providers/product_repo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allProductsProviders = FutureProvider<List<Product>>((ref) async {
  final productsRepositoryImpl = ref.watch(productRepoProvider);
  return await productsRepositoryImpl.fetchProducts();
});
