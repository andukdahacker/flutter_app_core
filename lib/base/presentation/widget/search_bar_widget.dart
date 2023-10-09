import 'package:flutter/material.dart';

import '../extension/extension.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: const InputDecoration().defaultThemeOf(context).copyWith(
        suffixIcon: const Icon(Icons.search_rounded)
      ),
    );
  }
}
