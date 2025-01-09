import 'package:stroll_test/shared/constants.dart';
extension StringExt on String {
  String get trimAssetPath => this.replaceAll(assetPrefixParentPath, "");
}
