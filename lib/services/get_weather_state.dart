import 'package:get/get.dart';
import 'package:kisan_helper/models/current_weather_api_model.dart';
import 'package:kisan_helper/services/current_weather_api_service.dart';
import 'package:kisan_helper/services/location_service.dart';

class RxWeatherView extends GetxController {
  var isLoading = true.obs;
  Rx<Weather> currentWeather = Weather().obs;
  LocationService locationService = LocationService();

  @override
  void onInit() {
    getWeather();

    getCurrentLocationData();
    super.onInit();
  }

  Future<void> getCurrentLocationData() async {
    await locationService.getCurrentLocation();
  }

  void getWeather() async {
    try {
      isLoading(true);
      await getCurrentLocationData();
      var weatherData =
          await WeatherApiService(locationData: locationService).getWeather();
      if (weatherData != null) {
        currentWeather.value = weatherData;
        update();
      }
    } finally {
      isLoading(false);
    }
  }

  // void getHourly() async {
  //   var result =
  //       WeatherApiService(locationData: locationService).getHourlyWeather();
  // }
}
