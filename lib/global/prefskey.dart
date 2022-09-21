import 'package:hive/hive.dart';

class PrefKeys {
  static const String USERDATA = 'userdata_staff';
  static const String TOKEN = 'token_staff';
  static const String LANG = 'language_staff';
  static const String STAFFID = 'staffId';
  static const String STAFF_APP_DEVICE_TOKEN = 'staff_app_device_token';

}

class PrefObj {
  static Box? preferences;
}
