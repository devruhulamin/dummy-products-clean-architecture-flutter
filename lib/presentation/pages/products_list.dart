import 'package:dummy_product/presentation/notifier/products_notifier.dart';
import 'package:dummy_product/presentation/pages/widgets/product_card.dart';
import 'package:dummy_product/presentation/providers/search_text_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsList extends ConsumerStatefulWidget {
  const ProductsList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductsListState();
}

class _ProductsListState extends ConsumerState<ProductsList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productsNotifierProvider);
    final productsNotifier = ref.watch(productsNotifierProvider.notifier);
    ref.listen(
      searchTextProvider,
      (previous, next) {
        if (next.isNotEmpty) {
          ref.read(productsNotifierProvider.notifier).searchProducts(next);
        }
      },
    );

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
                final searchText = ref.read(searchTextProvider);
                if (searchText.isNotEmpty) {
                  productsNotifier.loadMoreProducts(searchQuery: searchText);
                } else {
                  productsNotifier.loadMoreProducts();
                }
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              });
        }, error: (err, trace) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Something Went Wrong"),
                const SizedBox(height: 8),
                ElevatedButton(
                    onPressed: () => productsNotifier.refreshProducts(),
                    child: const Text("Retry")),
              ],
            ),
          );
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}
