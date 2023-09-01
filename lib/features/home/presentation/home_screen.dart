import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../base/presentation/screen/base_screen.dart';
import 'bloc/home_cubit.dart';

@RoutePage()
class HomeScreen extends BaseScreen<HomeCubit> {
  HomeScreen({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home page'),
      ),
    );
  }
}
