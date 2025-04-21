import 'package:dummy_product/presentation/notifier/products_notifier.dart';
import 'package:dummy_product/presentation/pages/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsList extends ConsumerWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsNotifierProvider);
    final productsNotifier = ref.watch(productsNotifierProvider.notifier);

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: products.when(data: (allProducts) {
          return GridView.builder(
              itemCount: (allProducts.length + 1),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 320,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8),
              itemBuilder: (context, index) {
                if (index < allProducts.length) {
                  final pdData = allProducts[index];
                  final data = ProductData(
                    id: pdData.id.toString(),
                    discountPercent: pdData.discountPercentage.toInt(),
                    imageUrl: pdData.thumbnail,
                    originalPrice: pdData.price,
                    price: pdData.price,
                    rating: pdData.rating,
                    reviewsCount: pdData.reviews.length,
                    isFavorite: index % 2 == 0,
                    title: pdData.title,
                    isOutOfStock: pdData.stock <= 0,
                  );
                  return ProductCard(
                    product: data,
                    onFavoriteTapped: (productId) {},
                  );
                }
                productsNotifier.loadMoreProducts();
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              });
        }, error: (err, trace) {
          print(err);
          print(trace);
          return null;
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}
