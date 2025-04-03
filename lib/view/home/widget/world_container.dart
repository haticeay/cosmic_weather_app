import 'package:cosmic_weather_app/assets.dart';
import 'package:cosmic_weather_app/core/cubit/weather_cubit.dart';
import 'package:cosmic_weather_app/core/model/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorldContainer extends StatelessWidget {
  const WorldContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherModel?>(
      builder: (context, weatherData) {
        // Eğer veri yoksa, yükleniyor simgesini göster
        if (weatherData == null) {
          return Center(child: CircularProgressIndicator());
        }

        return Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 3),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.blueGrey.shade900, Colors.black],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: 3,
                  ),
                ],
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  Assets.image.imWorldPNG,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dünya Hava Durumu",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.blueAccent,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildWeatherDataRow("Sıcaklık:",
                      "${weatherData.main?.temp?.toStringAsFixed(1)}°C"),
                  _buildWeatherDataRow("Hissedilen:",
                      "${weatherData.main?.feelsLike?.toStringAsFixed(1)}°C"),
                  _buildWeatherDataRow(
                      "Nem:", "${weatherData.main?.humidity}%"),
                  _buildWeatherDataRow(
                      "Basınç:", "${weatherData.main?.pressure} hPa"),
                  _buildWeatherDataRow("Rüzgar Hızı:",
                      "${weatherData.wind?.speed?.toStringAsFixed(1)} m/s"),
                  _buildWeatherDataRow("Açıklama:",
                      "${weatherData.weather?.first?.description ?? 'Belirsiz'}"),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildWeatherDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
