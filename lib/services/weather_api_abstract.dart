import 'package:kisan_helper/models/current_weather_api_model.dart';

abstract class WeatherApi {
  Future<Weather> getWeather();
}
