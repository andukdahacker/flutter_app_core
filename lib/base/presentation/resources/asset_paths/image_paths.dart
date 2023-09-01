import 'asset_path.dart';

class ImagePaths {
  static String get imgLogo => _getImagePath('img_logo.png');

  static String _getImagePath(String imageName) {
    return AssetsPaths.images + imageName;
  }
}
