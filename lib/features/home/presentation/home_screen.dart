import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../base/presentation/extension/extension.dart';
import '../../../base/presentation/widget/web_app_bar.dart';
import '../../auth/presentation/bloc/auth_cubit.dart';
import 'widget/suggested_search_keys_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWebWidget(
        height: context.screenHeight,
      ),
      body: Center(
        child: Column(
          children: [
            SearchAnchor(builder: (context, controller) {
              return SearchBar(
                controller: searchController,
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: Icon(Icons.search_rounded),
              );
            }, suggestionsBuilder: (context, controller) {
              return List.generate(
                  5,
                  (index) => ListTile(
                        title: Text('item $index'),
                        onTap: () {
                          setState(() {
                            controller.closeView('$index');
                          });
                        },
                      ));
            }),
            SuggestedSearchKeyWidget()
          ],
        ),
      ),
    );
  }
}
