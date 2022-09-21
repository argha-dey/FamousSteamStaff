/*
import 'dart:async';
import 'dart:convert';
import 'package:famous_steam_staff/global/config.dart';
import 'package:famous_steam_staff/global/prefskey.dart';
import 'package:famous_steam_staff/model/data_not_found.dart';
import 'package:famous_steam_staff/model/rating_review_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RatingreviewlistApi {
  Future<dynamic> onratingreviewlistApi() async {
    try {
      final uri = Uri.parse(Config.apiurl + Config.getratinglist);
      debugPrint("onRatingReview list url : $uri");

      final response = await http.get(uri, headers: {
        'content-Type': 'application/json',
        'Authorization': 'Bearer ${PrefObj.preferences!.get(PrefKeys.TOKEN)}'
      });

      dynamic responseJson;
      if (response.statusCode == 200) {
        responseJson = json.decode(response.body);
        debugPrint("onRatingReview list response : $responseJson");

        return RatingreviewListModel.fromJson(responseJson);
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
*/
