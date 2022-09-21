import 'dart:convert';

import 'package:famous_steam_staff/global/config.dart';
import 'package:famous_steam_staff/global/prefskey.dart';
import 'package:famous_steam_staff/model/data_not_found.dart';
import 'package:famous_steam_staff/model/status_complete_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatusCompleteApi {
  Future<dynamic> onstatuscompleteAPI(String orderid, String statusid) async {
    try {
      final uri = Uri.parse(Config.apiurl + "order/"+orderid);

      Map<String, String>  requestHeaders = {
        'Accept-Language': '${PrefObj.preferences!.get(PrefKeys.LANG)}',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${PrefObj.preferences!.get(PrefKeys.TOKEN)}'
      };


      Map<String,dynamic>  requestPostData = <String, dynamic>{
        'staff_status': statusid,
      };


      final response = await http.put(uri, body: requestPostData, headers: requestHeaders);  // for update

      if (true) {
        print('url---- $uri');
          print('post---- $requestPostData');
        print('res---- '+json.decode(response.body).toString());
      }

      dynamic responseJson;
      if (response.statusCode == 200) {
        responseJson = json.decode(response.body);
        debugPrint("onstatuscomplete response : $responseJson");

        return StatusCompleteModel.fromJson(responseJson);
      } else if (response.statusCode == 404) {
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
