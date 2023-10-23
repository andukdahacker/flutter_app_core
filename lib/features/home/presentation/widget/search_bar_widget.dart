import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../modules/di/di.dart';
import '../bloc/home_cubit.dart';
import '../bloc/home_state.dart';
import '../bloc/search/job/search_job_bloc.dart';
import '../bloc/search/job/search_job_event.dart';
import '../bloc/search/suggestion/suggestion_bloc.dart';
import '../bloc/search/suggestion/suggestion_event.dart';
import '../bloc/search/suggestion/suggestion_state.dart';
import '../bloc/search/tutor/search_tutor_bloc.dart';
import '../bloc/search/tutor/search_tutor_event.dart';
import 'suggested_search_keys_widget.dart';

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

  List<Widget> suggestionWidgets = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 300,
            maxWidth: 600,
          ),
          child: SearchAnchor(
              builder: (context, controller) => SearchBar(
                    controller: searchController,
                    onChanged: (_) {
                      getIt<SuggestionBloc>()
                          .add(SuggestionTextChanged(searchController.text));
                    },
                    onSubmitted: (value) {
                      final searchType = getIt<HomeCubit>().state.searchType;

                      switch (searchType) {
                        case SearchType.tutor:
                          getIt<SearchTutorBloc>()
                              .add(SearchTutorTextChanged(value));
                        case SearchType.job:
                          getIt<SearchJobBloc>()
                              .add(SearchJobTextChanged(value));
                      }
                    },
                    leading: const Icon(Icons.search_rounded),
                    trailing: [
                      BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          return DropdownMenu(
                              inputDecorationTheme: const InputDecorationTheme(
                                border: InputBorder.none,
                              ),
                              initialSelection: state.searchType,
                              onSelected: (value) {
                                if (value != null) {
                                  getIt<HomeCubit>().changeSearchType(value);
                                  switch (value) {
                                    case SearchType.tutor:
                                      getIt<SearchTutorBloc>().add(
                                          const SearchTutorTextChanged(''));
                                    case SearchType.job:
                                      getIt<SearchJobBloc>()
                                          .add(const SearchJobTextChanged(''));
                                  }
                                }
                              },
                              requestFocusOnTap: false,
                              dropdownMenuEntries: SearchType.values
                                  .map((e) => DropdownMenuEntry(
                                      value: e, label: e.value))
                                  .toList());
                        },
                      )
                    ],
                  ),
              viewConstraints: const BoxConstraints(
                maxHeight: 600,
                minHeight: 100,
              ),
              suggestionsBuilder: (context, controller) => []),
        ),
        SuggestedSearchKeyWidget(
          onSuggestionTap: (subject) {
            searchController.text = subject;
          },
        ),
      ],
    );
  }
}
