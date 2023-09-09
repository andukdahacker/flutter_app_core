import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import '../base/presentation/bloc/bloc_observer/observer.dart';
import '../features/auth/presentation/bloc/auth_cubit.dart';
import '../modules/di/di.dart';

Future<void> configMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    if (Platform.isAndroid || Platform.isIOS) {
      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
      );
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      );
    }
  }


  usePathUrlStrategy();

  await configureDependencies();

  getIt<AuthCubit>().checkAuth();
  // Set bloc observer and hydrated bloc storage.
  Bloc.observer = Observer();
}
