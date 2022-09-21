import 'dart:async';
import 'dart:convert';
import 'package:famous_steam_staff/global/config.dart';
import 'package:famous_steam_staff/global/prefskey.dart';
import 'package:famous_steam_staff/model/dashboard_model.dart';
import 'package:famous_steam_staff/model/data_not_found.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DashboardAPI {
  Future<dynamic> onDashboardAPI() async {
    try {
      final uri = Uri.parse(Config.apiurl + Config.dashboard);



      Map<String, String>  requestHeaders = {
        'Accept-Language': '${PrefObj.preferences!.get(PrefKeys.LANG)}',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${PrefObj.preferences!.get(PrefKeys.TOKEN)}'
      };
      print(requestHeaders);

      final response = await http.get(uri, headers: requestHeaders);

      print(jsonDecode(response.body));

      dynamic responseJson;
      if (response.statusCode == 200) {
        return DashboardModel?.fromJson(jsonDecode(response.body));
      }
      else if (response.statusCode == 500) {
        return DashboardModel?.fromJson(jsonDecode(response.body));
      }else if (response.statusCode == 403) {
        responseJson = json.decode(response.body);
        return DataNotFoundModel.fromJson(responseJson);
      } else {
        return null;
      }
    } catch (exception) {
      print('exception---- $exception');
      return null;
    }
  }
}

