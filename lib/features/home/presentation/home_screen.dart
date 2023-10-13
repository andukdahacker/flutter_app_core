import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../base/presentation/extension/extension.dart';
import '../../../base/presentation/widget/web_app_bar.dart';
import '../../../modules/di/di.dart';
import '../../../modules/router/router.dart';
import '../../auth/presentation/bloc/auth_cubit.dart';
import 'bloc/home_cubit.dart';
import 'bloc/search/home_search_bloc.dart';
import 'bloc/search/home_search_event.dart';
import 'bloc/search/home_search_state.dart';
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
        BlocProvider(create: (context) => getIt<HomeSearchBloc>()..add(const SearchTextChanged('')))
      ],
      child: Scaffold(
        appBar: AppBarWebWidget(
          height: context.screenHeight,
        ),
        endDrawer: const MenuDrawerWidget(),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SearchBarWidget(),
                SuggestedSearchKeyWidget(),
                BlocBuilder<HomeSearchBloc, HomeSearchState>(
                    builder: (context, state) {
                  return switch (state) {
                    HomeSearchStateEmpty() => Text('Empty'),
                    HomeSearchStateLoading() => CircularProgressIndicator(),
                    SearchJobStateSuccess(jobs: final jobs) => Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) => Placeholder(),
                          itemCount: jobs.length,
                        ),
                      ),
                    HomeSearchStateError(error: final error) => Text(error),
                  };
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
