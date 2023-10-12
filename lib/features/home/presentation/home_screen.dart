import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../base/presentation/extension/extension.dart';
import '../../../base/presentation/widget/web_app_bar.dart';
import '../../../modules/router/router.dart';
import '../../auth/presentation/bloc/auth_cubit.dart';
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
    return Scaffold(
      appBar: AppBarWebWidget(
        height: context.screenHeight,
      ),
      endDrawer: const MenuDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SearchBarWidget(),
            SuggestedSearchKeyWidget()
          ],
        ),
      ),
    );
  }
}
