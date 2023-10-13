import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../modules/di/di.dart';
import '../bloc/search/home_search_bloc.dart';

enum SearchType {
  tutor('Tutors'),
  job('Jobs');

  final String value;

  const SearchType(this.value);
}

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController searchController = TextEditingController();
  SearchType _searchType = SearchType.tutor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: SearchAnchor(
        builder: (context, controller) {
          return SearchBar(
            controller: searchController,
            onTap: () {
              controller.openView();
            },
            onChanged: (_) {
              controller.openView();
            },
            leading: const Icon(Icons.search_rounded),
            trailing: [
              DropdownMenu(
                  inputDecorationTheme: const InputDecorationTheme(
                    border: InputBorder.none,
                  ),
                  initialSelection: _searchType,
                  onSelected: (value) {
                    if (value != null) {
                      setState(() {
                        _searchType = value;
                      });
                    }
                  },
                  dropdownMenuEntries: SearchType.values
                      .map((e) => DropdownMenuEntry(value: e, label: e.value))
                      .toList())
            ],
          );
        },
        viewConstraints: BoxConstraints(
          maxHeight: 600,
        ),
        suggestionsBuilder: (context, controller) {
          return List.generate(
              5,
                  (index) =>
                  ListTile(
                    title: Text('item $index'),
                    onTap: () {
                      setState(() {
                        controller.closeView('$index');
                      });
                    },
                  ));
        },
      ),
    );
  }
}
