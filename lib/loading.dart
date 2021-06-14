import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/services/decode_data.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final key = '53c35e7e8abd3bc3d76a5afce24d6a16';
  String dayPlus2;
  String dayPlus3;
  String mornOrNight;

  Future getData(var latitude, var longitude) async {
    var response = await get(Uri.parse("https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=current,minutely,hourly,alerts&units=metric&appid=$key"));
    var jsondata = jsonDecode(response.body);
    WeatherItems.data = WeatherModel.fromJson(jsondata);
  }

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    await getData(position.latitude, position.longitude);

    print(WeatherItems.data.daily[0].dt);

    WeatherFactory wf = WeatherFactory(key);
    Weather w = await wf.currentWeatherByLocation(
        position.latitude, position.longitude);

    String temp = w.tempFeelsLike.toString();
    temp = temp.substring(0, temp.indexOf(' ')) + ' °C';
    // print(temp);

    String weatherCode = w.weatherIcon.toString();
    print(weatherCode);

    DateTime date = DateTime.now();
    if ((date.weekday) == 1) {
      dayPlus2 = "WEDNESDAY";
      dayPlus3 = "THURSDAY";
    } else if ((date.weekday) == 2) {
      dayPlus2 = "THURSDAY";
      dayPlus3 = "FRIDAY";
    } else if ((date.weekday) == 3) {
      dayPlus2 = "FRIDAY";
      dayPlus3 = "SATURDAY";
    } else if ((date.weekday) == 4) {
      dayPlus2 = "SATURDAY";
      dayPlus3 = "SUNDAY";
    } else if ((date.weekday) == 5) {
      dayPlus2 = "SUNDAY";
      dayPlus3 = "MONDAY";
    } else if ((date.weekday) == 6) {
      dayPlus2 = "MONDAY";
      dayPlus3 = "TUESDAY";
    } else if ((date.weekday) == 7) {
      dayPlus2 = "TUESDAY";
      dayPlus3 = "WEDNESDAY";
    }

    print(date.hour);
    if ((date.hour > 6) && (date.hour <= 19)) {
      mornOrNight = 'morn';
    } else if ((date.hour > 19) || (date.hour <= 6)) {
      mornOrNight = 'night';
    }
    print(mornOrNight);

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': w.areaName.toString(),
      'tempToday': temp,
      'mainIcon': weatherCode,
      'dayPlusOneTemp': (mornOrNight == 'morn')
          ? (WeatherItems.data.daily[1].temp.morn).toString() + '°'
          : (WeatherItems.data.daily[1].temp.night).toString() + '°',
      'dayPlusOneIcon': WeatherItems.data.daily[1].weatherV[0].icon,
      'dayPlusTwo': dayPlus2,
      'dayPlusTwoTemp': (mornOrNight == 'morn')
          ? (WeatherItems.data.daily[2].temp.morn).toString() + '°'
          : (WeatherItems.data.daily[2].temp.night).toString() + '°',
      'dayPlusTwoIcon': WeatherItems.data.daily[2].weatherV[0].icon,
      'dayPlusThree': dayPlus3,
      'dayPlusThreeTemp': (mornOrNight == 'morn')
          ? (WeatherItems.data.daily[3].temp.morn).toString() + '°'
          : (WeatherItems.data.daily[3].temp.night).toString() + '°',
      'dayPlusThreeIcon': WeatherItems.data.daily[3].weatherV[0].icon,
      'dayOrNight': mornOrNight,
    });
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    print(mornOrNight);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
