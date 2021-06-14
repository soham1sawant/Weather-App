import 'package:weather_app/data/data_provider/weather_api.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather/weather.dart';

class WeatherRepository {
  WeatherApi weatherApi;

  Future<WeatherModel> getWeatherForLocation() async {
    final rawWeather = await weatherApi.getRawWeather();
    final WeatherModel weather = WeatherModel.fromJson(rawWeather);
    return weather;
  }

  Future<Weather> getCurrentDayWeather() async {
    return await weatherApi.getCurrentWeather();    
  }
}
