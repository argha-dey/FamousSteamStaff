import 'dart:convert';

import 'package:famous_steam_staff/global/config.dart';
import 'package:famous_steam_staff/global/prefskey.dart';
import 'package:famous_steam_staff/model/data_not_found.dart';
import 'package:famous_steam_staff/model/login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  Future<dynamic> onLoginAPI(String mobile, String password) async {
    try {
      final uri = Uri.parse(Config.apiurl + Config.login);
      debugPrint("login url: $uri");
      final request = http.MultipartRequest('POST', uri);
      request.fields.addAll({
        'mobile': mobile,
        'password': password,
        'device_token': PrefObj.preferences!.get(PrefKeys.STAFF_APP_DEVICE_TOKEN)
      });
      var token = PrefObj.preferences!.get(PrefKeys.STAFF_APP_DEVICE_TOKEN);
      debugPrint("token req: $token");
      debugPrint("login req: $request");
      final http.Response response = await http.Response.fromStream(
        await request.send(),
      );
        return    response;
    } catch (exception) {
      print('exception---- $exception');
      return null;
    }
  }
}
