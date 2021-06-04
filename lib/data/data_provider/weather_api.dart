import 'dart:convert';
import 'package:http/http.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';

class WeatherApi {
  final String _appkey = "53c35e7e8abd3bc3d76a5afce24d6a16";
  double latitude;
  double longitude;

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;
  }

  Future getRawWeather() async {
    getLocation();
    var response = await get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/onecall?lat=${latitude.toString()}&lon=${longitude.toString()}&exclude=current,minutely,hourly,alerts&units=metric&appid=$_appkey"));

    var rawWeather = jsonDecode(response.body);
    return rawWeather;
  }

  Future<Weather> getCurrentWeather() async {
    getLocation();
    WeatherFactory wF = WeatherFactory(_appkey);
    Weather w = await wF.currentWeatherByLocation(latitude, longitude);

    return w;
  }
}
