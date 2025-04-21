import 'package:dummy_product/presentation/providers/sort_provider.dart';
import 'package:flutter/material.dart';

class SortBottomSheet extends StatelessWidget {
  final SortOption? selected;
  final Function(SortOption) onSelect;

  const SortBottomSheet({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Sort By',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildOption(
              context, SortOption.priceHighToLow, 'Price - High to Low'),
          _buildOption(
              context, SortOption.priceLowToHigh, 'Price - Low to High'),
          _buildOption(context, SortOption.rating, 'Rating'),
        ],
      ),
    );
  }

  Widget _buildOption(BuildContext context, SortOption option, String title) {
    final isSelected = option == selected;
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        onSelect(option);
      },
    );
  }
}

typedef OnSortOptionSelected = void Function(SortOption option);
void showSortSheet(BuildContext context, SortOption? currentSort,
    OnSortOptionSelected onSelect) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) => SortBottomSheet(
      selected: currentSort,
      onSelect: (selectedOption) {
        onSelect(selectedOption);
      },
    ),
  );
}
