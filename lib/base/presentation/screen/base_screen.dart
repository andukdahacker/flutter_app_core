import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../app/app_cubit.dart';
import '../../../di/di.dart';
import '../../domain/navigation/app_navigation.dart';
import '../bloc/base_cubit.dart';
import '../common_cubit/common_cubit.dart';
import '../common_cubit/common_state.dart';

abstract class BaseScreen<B extends BaseCubit> extends StatelessWidget {
  BaseScreen({super.key});

  final AppNavigator navigation = getIt.get<AppNavigator>();

  final AppCubit appCubit = getIt.get<AppCubit>();

  final myBloc = getIt.get<B>();

  @override
  Widget build(BuildContext context) {
    return Provider<AppNavigator>(
      create: (context) => navigation,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => myBloc),
          BlocProvider(create: (_) => myBloc.commonCubit),
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
