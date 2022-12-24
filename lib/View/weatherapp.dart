import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/Model/weather_model.dart';
import 'package:weather_app/controller/APIMANAGER/Api_manager.dart';
import 'package:weather_app/controller/APIMANAGER/widgets.dart';

class weather_app extends StatefulWidget {
  final city;

  weather_app([this.city]);
  @override
  State<weather_app> createState() => _weather_appState();
}

class _weather_appState extends State<weather_app> {
  void initState() {
    fetchWeatherByCity();
    super.initState();
  }

  var locationData;

  WeatherModel? selectWeather;
  fetchWeatherByCity() async {
    locationData =
        await ApiManager.getCityWeather('${widget.city ?? "lahore"} ');
    selectWeather = WeatherModel.fromJson(locationData);
    // var data = await http.get(Uri.parse(
    //     "https://api.openweathermap.org/data/2.5/weather?q=london&appid=b31e38bc42a13cc6a99ac50bc786c8d3"));
    // // print(jsonDecode(data.body).runtimeType);

    // locationData = jsonDecode(data.body);
    // // print(locationData["main"]["feels_like"]);
    // log("=>>>>>$locationData");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   fetchWeatherByCity();
      // }),
      body: locationData == null
          ? Center(child: CircularProgressIndicator.adaptive())
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/${selectimage(selectWeather!.weather![0].main)}"),
                        fit: BoxFit.cover)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Customtext(
                        text: "Today Weather",
                        fontweight: FontWeight.w600,
                        size: 30,
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Customtext(
                              text: "${selectWeather!.name}",
                              size: 72,
                              fontweight: FontWeight.w700,
                              color: Colors.white70,
                            ),
                            Customtext(
                              text: "${gettemp(selectWeather!.main!.temp)}°C",
                              size: 60,
                              fontweight: FontWeight.bold,
                            ),
                            // SizedBox(
                            //   height: 8,
                            // ),
                            Customtext(
                              text: "${selectWeather!.weather![0].main}",
                              size: 30,
                              fontweight: FontWeight.w400,
                            ),
                          ]),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(children: [
                              Customtext(
                                text: "Humidity",
                                size: 25,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Customtext(
                                text: "${selectWeather!.main!.humidity}°C",
                                size: 20,
                                fontweight: FontWeight.bold,
                              ),
                            ]),
                            //

                            Column(children: [
                              Customtext(
                                text: "Feels Like",
                                size: 23,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Customtext(
                                text: "${selectWeather!.main!.feelsLike}",
                                size: 20,
                                fontweight: FontWeight.bold,
                              ),
                            ]),

                            Column(children: [
                              Customtext(
                                text: "Wind Speed",
                                size: 23,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Customtext(
                                text: "${selectWeather!.wind!.speed}°C",
                                size: 20,
                                fontweight: FontWeight.bold,
                              ),
                            ]),
                          ]),
                    ]),
              ),
            ),
    );
  }
}

selectimage(weather) {
  var image;
  var finalimage;
  image = weather.toString().toLowerCase();
  if (image == "clouds") {
    finalimage = "cloud.jpg";
  } else if (image == "smoke") {
    finalimage = "fog.jpg";
  } else if (image == "sunny") {
    finalimage = "sunny.jpg";
  } else if (image == "rainy") {
    finalimage = "rainy.jpg";
  } else if (image == "haze") {
    finalimage = "haze1.jpg";
  } else if (image == "thunderstom") {
    finalimage = "thunderstom.jpg";
  } else if (image == "clear") {
    finalimage = "clean.jpg";
  } else {
    finalimage = "haze.jpg";
  }
  return finalimage;
}

gettemp(temp) {
  return (temp - 273).round();
}

// {
//   "coord": {
//     "lon": 74.344,
//     "lat": 31.5801
//   },
//   "weather": [
//     {
//       "id": 800,
//       "main": "Clear",
//       "description": "clear sky",
//       "icon": "01d"
//     }
//   ],
//   "base": "stations",
//   "main": {
//     "temp": 296.14,
//     "feels_like": 295.3,
//     "temp_min": 294.21,
//     "temp_max": 296.14,
//     "pressure": 1015,
//     "humidity": 31
//   },
//   "visibility": 6000,
//   "wind": {
//     "speed": 3.09,
//     "deg": 240
//   },
//   "clouds": {
//     "all": 0
//   },
//   "dt": 1671017330,
//   "sys": {
//     "type": 1,
//     "id": 7585,
//     "country": "PK",
//     "sunrise": 1670982834,
//     "sunset": 1671019230
//   },
//   "timezone": 18000,
//   "id": 1172451,
//   "name": "Lahore",
//   "cod": 200
// }