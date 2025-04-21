import 'package:dummy_product/presentation/notifier/products_notifier.dart';
import 'package:dummy_product/presentation/pages/widgets/sort_bottom_sheet.dart';
import 'package:dummy_product/presentation/providers/sort_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SortOptionBar extends ConsumerWidget {
  const SortOptionBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currSort = ref.watch(sortOptionsProvider);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: const Icon(Icons.filter_list),
        onPressed: () {
          showSortSheet(
            context,
            currSort,
            (option) {
              ref.read(sortOptionsProvider.notifier).state = option;
              ref.watch(productsNotifierProvider.notifier).refreshProducts();
            },
          );
        },
      ),
    );
  }
}
