import 'dart:convert';
import 'package:http/http.dart';
import 'package:kisan_helper/models/current_weather_api_model.dart';
import 'package:kisan_helper/services/location_service.dart';

const ApiKey = "cb485dd4f7aa20980bf067e905e0da34";

class WeatherApiService {
  WeatherApiService({
    required this.locationData,
  });
  LocationService locationData;
  //ENTER-YOUR-OWN-API-KEY
  // final weather = weatherFromJson;

  Future<Weather> getWeather() async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=$ApiKey&units=metric');
    Response response = await get(url);

    if (response.statusCode != 200) {
      throw Exception('error retrieving weather ${response.statusCode}');
    }
    return Weather.fromJson(jsonDecode(response.body));
  }
}
