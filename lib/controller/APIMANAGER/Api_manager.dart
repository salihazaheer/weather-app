import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiManager {
  static const BaseURL = "https://jsonplaceholder.typicode.com/";
  static const WeatherUrl = "https://api.openweathermap.org/data/2.5/weather";
//jsonview
//app.quicktype.io
// intl date, time set

  static getphoto() async {
    try {
      var response = await http.get(Uri.parse("$BaseURL/photos"));
      log(response.body);
      var originaldata = jsonDecode(response.body);
      return originaldata;
    } catch (e) {
      print(e);
    }
  }

  static getCityWeather(city) async {
    try {
      var url = await http.get(Uri.parse(
          "$WeatherUrl?q=$city&appid=b31e38bc42a13cc6a99ac50bc786c8d3"));
      var response = jsonDecode(url.body);
      return response;
    } catch (e) {
      print(e);
    }
  }
}
