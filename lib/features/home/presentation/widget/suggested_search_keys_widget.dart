import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../modules/di/di.dart';
import '../bloc/home_cubit.dart';
import '../bloc/search/job/search_job_bloc.dart';
import '../bloc/search/job/search_job_event.dart';
import '../bloc/search/suggestion/suggestion_bloc.dart';
import '../bloc/search/suggestion/suggestion_state.dart';
import '../bloc/search/tutor/search_tutor_bloc.dart';
import '../bloc/search/tutor/search_tutor_event.dart';
import 'search_bar_widget.dart';

class SuggestedSearchKeyWidget extends StatelessWidget {
  const SuggestedSearchKeyWidget({super.key, required this.onSuggestionTap});

  final void Function(String) onSuggestionTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Suggested'),
        BlocBuilder<SuggestionBloc, SuggestionState>(
          builder: (context, state) {
            switch (state) {
              case SuggestionStateEmpty():
                return SizedBox.shrink();
              case SuggestionStateLoading():
                return CircularProgressIndicator();
              case SuggestionStateSuccess(subjects: final subjects):
                return Wrap(
                  children: subjects
                      .map((e) => InkWell(
                          onTap: () {
                            final searchType = getIt<HomeCubit>().state.searchType;

                            onSuggestionTap.call(e.name);
                            switch(searchType) {
                              case SearchType.tutor:
                                getIt<SearchTutorBloc>().add(SearchTutorTextChanged(e.name));
                              case SearchType.job:
                                getIt<SearchJobBloc>().add(SearchJobTextChanged(e.name));
                            }
                          },
                          child: Chip(label: Text(e.name))))
                      .toList(),
                );
              case SuggestionStateError():
                return Text('Error');
            }
          },
        ),
      ],
    );
  }
}
