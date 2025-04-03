import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cosmic_weather_app/core/model/weather_model.dart';
import 'package:cosmic_weather_app/core/repo/weather_repo.dart';

class WeatherCubit extends Cubit<WeatherModel?> {
  WeatherCubit() : super(null);

  final WeatherRepo _weatherRepo = WeatherRepo();

  Future<void> fetchWeather(String cityName) async {
    final weatherData = await _weatherRepo.getWeatherByCityName(cityName);
    emit(weatherData);
  }
}