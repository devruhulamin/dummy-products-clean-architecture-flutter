import 'package:flutter/material.dart';

class SearchBarWithFilter extends StatefulWidget {
  const SearchBarWithFilter({
    super.key,
  });

  @override
  State<SearchBarWithFilter> createState() => _SearchBarWithFilterState();
}

class _SearchBarWithFilterState extends State<SearchBarWithFilter> {
  final searchCon = TextEditingController();

  @override
  void dispose() {
    searchCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Search TextField
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
