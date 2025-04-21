import 'package:flutter/material.dart';

typedef OnFavoriteTapped = Function(String productId);

class ProductCard extends StatelessWidget {
  final ProductData product;
  final OnFavoriteTapped onFavoriteTapped;

  const ProductCard(
      {super.key, required this.product, required this.onFavoriteTapped});

  @override
  Widget build(BuildContext context) {
    final cardWidth = (MediaQuery.of(context).size.width - 48) / 2;

    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image + overlays
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      const Center(child: Icon(Icons.broken_image)),
                ),
              ),
              if (product.isOutOfStock)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Out Of Stock',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    onFavoriteTapped(product.id);
                  },
                  child: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: product.isFavorite ? Colors.red : Colors.white,
                    size: 24,
                    shadows: const [
                      Shadow(blurRadius: 4, color: Colors.black26),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Textual info
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 8),

                // Price row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '\$${product.price.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '\$${product.originalPrice.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${product.discountPercent}% OFF',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange.shade700,
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
                const SizedBox(height: 8),

                // Rating row
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(
                      product.rating.toStringAsFixed(1),
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '(${product.reviewsCount})',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// product data class
class ProductData {
  final String id;
  final String imageUrl;
  final String title;
  final double price;
  final double originalPrice;
  final int discountPercent;
  final double rating;
  final int reviewsCount;
  final bool isFavorite;
  final bool isOutOfStock;

  ProductData({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.discountPercent,
    required this.rating,
    required this.reviewsCount,
    this.isFavorite = false,
    this.isOutOfStock = false,
  });
}
