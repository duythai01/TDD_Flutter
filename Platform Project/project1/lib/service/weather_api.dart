// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project1/data/models/weather_models.dart';

class API {
  String key = "c676361e997e4d25b0c92424232706";

  Future<WeatherCurrent> fetchDataCurrent(String location) async {
    var url = Uri.parse('http://api.weatherapi.com/v1/forecast.json');
    var params = {'key': key, 'q': location};
    var uri = url.replace(queryParameters: params);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      // Xử lý dữ liệu response ở đây
      var body = jsonDecode(response.body);
      return WeatherCurrent.fromJson(body);
    } else {
      print("error");
    }
    return WeatherCurrent();
  }
}
