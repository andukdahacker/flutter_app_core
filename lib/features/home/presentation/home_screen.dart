import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../base/presentation/extension/extension.dart';
import '../../../base/presentation/widget/web_app_bar.dart';
import '../../../modules/di/di.dart';
import '../../auth/presentation/bloc/auth_cubit.dart';
import 'bloc/home_cubit.dart';
import 'bloc/search/home_search_bloc.dart';
import 'bloc/search/home_search_event.dart';
import 'bloc/search/home_search_state.dart';
import 'widget/job_card_widget.dart';
import 'widget/menu_drawer_widget.dart';
import 'widget/search_bar_widget.dart';
import 'widget/suggested_search_keys_widget.dart';

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
                getIt<HomeSearchBloc>()..add(const SearchTextChanged('')))
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
          body: Column(
            children: [
              const SearchBarWidget(),
              const SuggestedSearchKeyWidget(),
              BlocBuilder<HomeSearchBloc, HomeSearchState>(
                  builder: (context, state) => switch (state) {
                        HomeSearchStateEmpty() => const Text('Empty'),
                        HomeSearchStateLoading() =>
                          const CircularProgressIndicator(),
                        SearchJobStateSuccess(jobs: final jobs) => Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 36,
                                        childAspectRatio: 3 / 2,
                                        mainAxisSpacing: 36),
                                itemBuilder: (context, index) => JobCardWidget(
                                  job: jobs[index],
                                ),
                                itemCount: jobs.length,
                              ),
                            ),
                          ),
                        HomeSearchStateError(error: final error) =>
                          Text(error),
                      }),
            ],
          ),
        ),
      ),
    );
  }
}
