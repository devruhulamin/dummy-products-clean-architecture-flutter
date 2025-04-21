import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SortOption {
  priceHighToLow,
  priceLowToHigh,
  rating,
}

final sortOptionsProvider =
    StateProvider<SortOption>((ref) => SortOption.priceHighToLow);
