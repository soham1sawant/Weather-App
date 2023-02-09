import 'dart:convert';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:http/http.dart' as http;
import 'package:weather_api/src/models/weather_model.dart';

class HttpException implements Exception {}

class HttpRequestFailure implements Exception {
  final int statusCode;

  HttpRequestFailure(this.statusCode);
}

class JsonDecodeException implements Exception {}

class JsonDeserializationException implements Exception {}

class WeatherApiClient {
  final String _appkey = "53c35e7e8abd3bc3d76a5afce24d6a16";

  Future<Position> getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled == false) {
      return Future.error('Location services disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permission DENIED !');
      }
    } else if (permission == LocationPermission.deniedForever) {
      print('Location permissions are PERMANENTLY DENIED !!');
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    log(position.toString());

    return position;
  }

  Future<Weather> getCurrentWeather() async {
    Position position = await getLocation();

    WeatherFactory wF = WeatherFactory(_appkey);
    Weather w = await wF.currentWeatherByLocation(
      position.latitude,
      position.longitude,
    );

    log(w.toString());

    return w;
  }

  Future<WeatherModel> getAllWeather() async {
    Position position = await getLocation();
    final uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${position.latitude.toString()}&lon=${position.longitude.toString()}&exclude=current,minutely,hourly,alerts&units=metric&appid=$_appkey');

    http.Response response;
    try {
      response = await http.get(uri);
    } on Exception {
      throw HttpException();
    }

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }

    final body;
    try {
      body = jsonDecode(response.body);
    } on Exception {
      throw JsonDecodeException();
    }

    try {
      log(WeatherModel.fromJson(body).toString());
      return WeatherModel.fromJson(body);
    } on Exception {
      throw JsonDeserializationException();
    }
  }
}
