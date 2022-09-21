import 'dart:async';
import 'dart:convert';
import 'package:famous_steam_staff/global/config.dart';
import 'package:famous_steam_staff/global/prefskey.dart';
import 'package:famous_steam_staff/model/data_not_found.dart';
import 'package:famous_steam_staff/model/getrating_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetratingApi {
  Future<dynamic> onRatingAPI(String author_id,String model_id,String order_id,String review,String rating ) async {
  try {
    final uri = Uri.parse(Config.apiurl + 'rating');



    Map<String,dynamic>  requestPostData = <String, dynamic>{
      'type': 'staff',
      'rating': rating,
      'order_id': order_id,
      'review': review,
      "model_id": model_id,
      "author_id": author_id,
    };
print("get rate postdata${requestPostData}");
    Map<String, String>  requestHeaders = {
      'Accept-Language': '${PrefObj.preferences!.get(PrefKeys.LANG)}',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${PrefObj.preferences!.get(PrefKeys.TOKEN)}'
    };

    //  var _body = json.encode(requestPostData);

    final response = await http.post(uri, body: requestPostData, headers: requestHeaders);

    dynamic responseJson;
    if (response.statusCode == 200) {
      responseJson = json.decode(response.body);
      debugPrint("getrating response: $responseJson" );
      return ServiceRatingModel.fromJson(responseJson);
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
/*  Future<dynamic> ongetratingApi() async {
    try {
      final uri = Uri.parse(Config.apiurl + Config.getrating);
      debugPrint("ongetrating url : $uri");
      final response = await http.get(uri, headers: {
        'content-Type': 'application/json',
        'Authorization': 'Bearer ${PrefObj.preferences!.get(PrefKeys.TOKEN)}'
      });

      dynamic responseJson;
      if (response.statusCode == 200) {
        debugPrint("ongetrating response : $responseJson");

        responseJson = json.decode(response.body);
        return GetratingModel.fromJson(responseJson);
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
  }*/
}
