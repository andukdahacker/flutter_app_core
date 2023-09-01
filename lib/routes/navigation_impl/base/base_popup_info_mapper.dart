import 'package:flutter/material.dart';
import '../../../base/domain/navigation/app_navigation.dart';
import '../../../base/domain/navigation/app_popup_info.dart';

abstract class BasePopupInfoMapper {
  Widget map(AppPopupInfo appRouteInfo, AppNavigator navigator);
}
