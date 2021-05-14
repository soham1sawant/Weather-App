class WeatherItems {
  static var data;
}

class WeatherModel {
  double latitude;
  double longitude;
  String timezone;
  int timezoneOffset;
  List<Daily> daily;

  WeatherModel({
    this.latitude,
    this.longitude,
    this.timezone,
    this.timezoneOffset,
    this.daily,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    var list = json['daily'] as List;
    List<Daily> dailyList = list.map((i) => Daily.fromJson(i)).toList();

    return WeatherModel(
        latitude: json["lat"],
        longitude: json["lon"],
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        daily: dailyList);
  }
}

class Daily {
  int dt;
  int sunrise;
  int sunset;
  Temperature temp;
  FeelsLike feelsLike;
  num pressure;
  num humidity;
  num dewPoint;
  num windSpeed;
  List weatherV;
  num clouds;
  num pop;
  num uvi;

  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.weatherV,
    this.clouds,
    this.pop,
    this.uvi,
  });

  factory Daily.fromJson(Map<String, dynamic> dailyList) {
    var list2 = dailyList["weather"] as List;
    List<WeatherV> weatherVList =
        list2.map((i) => WeatherV.fromJson(i)).toList();

    return Daily(
        dt: dailyList["dt"],
        sunrise: dailyList["sunrise"],
        sunset: dailyList["sunset"],
        temp: Temperature.fromJson(dailyList["temp"]),
        feelsLike: FeelsLike.fromJson(dailyList["feels_like"]),
        pressure: dailyList["pressure"],
        humidity: dailyList["humidity"],
        dewPoint: dailyList["dew_point"],
        windSpeed: dailyList["wind_speed"],
        weatherV: weatherVList,
        clouds: dailyList["clouds"],
        pop: dailyList["pop"],
        uvi: dailyList["uvi"]);
  }
}

class Temperature {
  num day;
  num min;
  num max;
  num night;
  num eve;
  num morn;

  Temperature({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  factory Temperature.fromJson(Map<String, dynamic> tempJson) {
    return Temperature(
      day: tempJson["day"],
      min: tempJson["min"],
      max: tempJson["max"],
      night: tempJson["night"],
      eve: tempJson["eve"],
      morn: tempJson["morn"],
    );
  }
}

class FeelsLike {
  num day;
  num night;
  num eve;
  num morn;

  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  factory FeelsLike.fromJson(Map<String, dynamic> feelsJson) {
    return FeelsLike(
      day: feelsJson["day"],
      night: feelsJson["night"],
      eve: feelsJson["eve"],
      morn: feelsJson["morn"],
    );
  }
}

class WeatherV {
  num id;
  String main;
  String description;
  String icon;

  WeatherV({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherV.fromJson(Map<String, dynamic> weatherJson) {
    return WeatherV(
        id: weatherJson["id"],
        main: weatherJson["main"],
        description: weatherJson["description"],
        icon: weatherJson["icon"]);
  }
}
