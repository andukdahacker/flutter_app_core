import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'app_state.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  void changeTheme(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }
}
