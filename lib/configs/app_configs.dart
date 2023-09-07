import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import '../base/presentation/bloc/bloc_observer/observer.dart';
import '../modules/di/di.dart';

Future<void> configMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  // );
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     systemNavigationBarColor: Colors.transparent,
  //     systemNavigationBarIconBrightness: Brightness.dark,
  //     statusBarColor: Colors.transparent,
  //     statusBarIconBrightness: Brightness.dark,
  //   ),
  // );
  usePathUrlStrategy();


  configureDependencies();

  // Set bloc observer and hydrated bloc storage.
  Bloc.observer = Observer();
}
