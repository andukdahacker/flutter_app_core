import 'asset_path.dart';

class IconPaths {
  static String get icError => _getImagePath('ic_error.svg');
  static String get icLogo => _getImagePath('ic_logo.svg');

  static String _getImagePath(String imageName) {
    return AssetsPaths.icons + imageName;
  }
}
