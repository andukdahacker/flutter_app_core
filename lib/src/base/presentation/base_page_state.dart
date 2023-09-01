import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../modules/di/di.dart';
import '../../app/app_cubit.dart';
import '../domain/navigation/app_navigation.dart';
import 'bloc/base_cubit.dart';
import 'common_cubit/common_cubit.dart';
import 'common_cubit/common_state.dart';

abstract class BasePageState<B extends BaseCubit> extends StatelessWidget {
  BasePageState({super.key});

  final AppNavigator navigation = getIt.get<AppNavigator>();
  final AppCubit appCubit = getIt.get<AppCubit>();
  late final commonCubit = getIt.get<CommonCubit>()
    ..navigation = navigation
    ..appCubit = appCubit;
  late final myBloc = getIt.get<B>()
    ..navigation = navigation
    ..appCubit = appCubit
    ..commonCubit = commonCubit;

  @override
  Widget build(BuildContext context) {
    return Provider<AppNavigator>(
      create: (context) => navigation,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => myBloc),
          BlocProvider(create: (_) => commonCubit),
        ],
        child: BlocListener<CommonCubit, CommonState>(
          listener: (BuildContext context, state) {},
          child: Stack(
            children: [
              buildPage(context),
              BlocBuilder<CommonCubit, CommonState>(
                buildWhen: (previous, current) =>
                    previous.isLoading != current.isLoading,
                builder: (context, state) => Visibility(
                  visible: state.isLoading,
                  child: buildPageLoading(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPageLoading() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget buildPage(BuildContext context);
}
