import 'package:arator/app.dart';

abstract class AppImage {
  static formUrl(imageUrl) {
    return AppInfo.baseUrl + imageUrl;
  }
}
