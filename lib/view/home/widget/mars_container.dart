import 'package:cosmic_weather_app/core/constants/app_space.dart';
import 'package:cosmic_weather_app/core/cubit/nasa_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cosmic_weather_app/core/model/nasa_model.dart';
import 'package:cosmic_weather_app/assets.dart';

class MarsContainer extends StatelessWidget {
  const MarsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNasaCubit, List<NasaModel>>(
      builder: (context, nasaModels) {
        print(nasaModels);
        // Eğer veri boşsa, yükleniyor simgesini göster
        if (nasaModels.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        // Burada Mars'tan gelen veriyi alıyoruz
        final marsData = nasaModels.first; // İlk öğeyi alıyoruz

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
                  Assets.image.imMarsPNG,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mars Hava Durumu",
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
                  AppSpace.vertical.space20,
                  _buildWeatherDataRow(
                      "Sıcaklık:", "${marsData.avgTemp?.toStringAsFixed(1)}°C"),
                  _buildWeatherDataRow("Basınç:",
                      "${marsData.pressure?.toStringAsFixed(2)} hPa"),
                  _buildWeatherDataRow("Rüzgar Hızı:",
                      "${marsData.horizontalWindSpeed?.toStringAsFixed(2)} m/s"),
                  _buildWeatherDataRow("Rüzgar Yönü:",
                      "${marsData.windDirectionCompassPoint ?? 'Belirsiz'}"),
                  _buildWeatherDataRow(
                      "Atmosfer:", "${marsData.atmoOpacity ?? 'Belirsiz'}"),
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
