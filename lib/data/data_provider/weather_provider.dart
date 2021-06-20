import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather/weather.dart';

class WeatherProvider {
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
        desiredAccuracy: LocationAccuracy.high);

    return position;
  }

  Future getRawWeather() async {
    Position position = await getLocation();
    var response = await get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/onecall?lat=${position.latitude.toString()}&lon=${position.longitude.toString()}&exclude=current,minutely,hourly,alerts&units=metric&appid=$_appkey"));

    var rawWeather = jsonDecode(response.body);
    return rawWeather;
  }

  Future<Weather> getCurrentWeather() async {
    Position position = await getLocation();
    WeatherFactory wF = WeatherFactory(_appkey);
    Weather w = await wF.currentWeatherByLocation(position.latitude, position.longitude);

    return w;
  }
}
