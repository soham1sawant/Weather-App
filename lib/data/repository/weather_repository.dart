import '../data_provider/weather_provider.dart';
import '../model/weather_model.dart';
import 'package:weather/weather.dart';

class WeatherRepository {
  final weatherApi = WeatherProvider();

  Future<WeatherModel> getWeatherForLocation() async {
    final rawWeather = await weatherApi.getRawWeather();
    final WeatherModel weather = WeatherModel.fromJson(rawWeather);
    return weather;
  }

  Future<Weather> getCurrentDayWeather() async {
    return await weatherApi.getCurrentWeather();    
  }
}
