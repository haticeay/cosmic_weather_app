import 'package:cosmic_weather_app/core/model/weather_model.dart';
import 'package:cosmic_weather_app/core/service/open_weather_map_service.dart';

class WeatherRepo {
  final WeatherMapService _weatherMapService = WeatherMapService();

  Future<WeatherModel?> getWeatherByCityName(String cityName) async {
    try {
      final response = await _weatherMapService.getMethod(
        url: "/weather",
        queryParameters: {"q": cityName},
        fromJson: (json) => WeatherModel.fromJson(json),
      );
      return response;
    } catch (error) {
      print("OpenWeatherMap API Hatası: $error");
      return null;
    }
  }
}