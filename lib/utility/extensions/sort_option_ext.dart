import 'package:dummy_product/domain/entities/product.dart';
import 'package:dummy_product/presentation/providers/sort_provider.dart';

extension SortOptionExtension on SortOption {
  Comparator<Product> get getComparator {
    switch (this) {
      case SortOption.priceHighToLow:
        return (a, b) => b.price.compareTo(a.price);
      case SortOption.priceLowToHigh:
        return (a, b) => a.price.compareTo(b.price);
      case SortOption.rating:
        return (a, b) => b.rating.compareTo(a.rating);
    }
  }
}
