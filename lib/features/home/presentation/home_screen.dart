import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../base/presentation/extension/extension.dart';
import '../../../base/presentation/widget/web_app_bar.dart';
import '../../../modules/di/di.dart';
import '../../auth/presentation/bloc/auth_cubit.dart';
import 'bloc/home_cubit.dart';
import 'bloc/home_state.dart';
import 'bloc/search/job/search_job_bloc.dart';
import 'bloc/search/job/search_job_event.dart';
import 'bloc/search/job/search_job_state.dart';
import 'bloc/search/suggestion/suggestion_bloc.dart';
import 'bloc/search/suggestion/suggestion_event.dart';
import 'bloc/search/tutor/search_tutor_bloc.dart';
import 'bloc/search/tutor/search_tutor_state.dart';
import 'widget/job_card_widget.dart';
import 'widget/menu_drawer_widget.dart';
import 'widget/search_bar_widget.dart';
import 'widget/tutor_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HomeCubit>()),
        BlocProvider(
            create: (context) =>
                getIt<SearchJobBloc>()..add(const SearchJobTextChanged(''))),
        BlocProvider(create: (context) => getIt<SearchTutorBloc>()),
        BlocProvider(create: (context) => getIt<SuggestionBloc>()..add(const SuggestionTextChanged(''))),
      ],
      child: BlocListener<AuthCubit, AuthState>(
        listenWhen: (previous, current) =>
            previous.authenticated != current.authenticated,
        listener: (context, state) {
          if (!state.authenticated) {
            context.go('/login');
          }
        },
        child: Scaffold(
          appBar: AppBarWebWidget(
            height: context.screenHeight,
          ),
          endDrawer: const MenuDrawerWidget(),
          body: BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) =>
                previous.searchType != current.searchType,
            builder: (context, state) {
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: SearchBarWidget(),
                  ),
                  if (state.searchType == SearchType.job)
                    BlocBuilder<SearchJobBloc, SearchJobState>(
                        builder: (context, state) {
                      int gridCrossAxisCount = 3;

                      if (context.isSmallScreen) {
                        gridCrossAxisCount = 2;
                      } else if (context.isExtraSmallScreen) {
                        gridCrossAxisCount = 1;
                      } else {
                        gridCrossAxisCount = 3;
                      }

                      return switch (state) {
                        SearchJobStateEmpty() => const Text('Empty'),
                        SearchJobStateLoading() =>
                          const CircularProgressIndicator(),
                        SearchJobStateSuccess(jobs: final jobs) => Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 16),
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: gridCrossAxisCount,
                                        crossAxisSpacing: 36,
                                        childAspectRatio: 4 / 3,
                                        mainAxisSpacing: 36),
                                itemBuilder: (context, index) => JobCardWidget(
                                  job: jobs[index],
                                ),
                                itemCount: jobs.length,
                              ),
                            ),
                          ),
                        SearchJobStateError(error: final error) => Text(error),
                      };
                    }),
                  if (state.searchType == SearchType.tutor)
                    BlocBuilder<SearchTutorBloc, SearchTutorState>(
                        builder: (context, state) {
                      int gridCrossAxisCount = 3;

                      if (context.isSmallScreen) {
                        gridCrossAxisCount = 2;
                      } else if (context.isExtraSmallScreen) {
                        gridCrossAxisCount = 1;
                      } else {
                        gridCrossAxisCount = 3;
                      }

                      return switch (state) {
                        SearchTutorStateEmpty() => const Text('Empty'),
                        SearchTutorStateLoading() =>
                          const CircularProgressIndicator(),
                        SearchTutorStateSuccess(tutors: final tutors) =>
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 16),
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: gridCrossAxisCount,
                                        crossAxisSpacing: 36,
                                        childAspectRatio: 4 / 3,
                                        mainAxisSpacing: 36),
                                itemBuilder: (context, index) =>
                                    TutorCardWidget(
                                  tutor: tutors[index],
                                ),
                                itemCount: tutors.length,
                              ),
                            ),
                          ),
                        SearchTutorStateError(error: final error) =>
                          Text(error),
                      };
                    }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
