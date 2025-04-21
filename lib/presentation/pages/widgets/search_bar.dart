import 'package:dummy_product/presentation/providers/search_text_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBarWithFilter extends ConsumerStatefulWidget {
  const SearchBarWithFilter({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchBarWithFilterState();
}

class _SearchBarWithFilterState extends ConsumerState<SearchBarWithFilter> {
  final searchCon = TextEditingController();

  @override
  void dispose() {
    searchCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchTextNotifer = ref.read(searchTextProvider.notifier);
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.black54),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      searchTextNotifer.state = value;
                    },
                    controller: searchCon,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 12),

        // Filter Button
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
