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
        print(nasaModels.lastOrNull?.the677?.AT?.ct);
        // Eğer veri boşsa, yükleniyor simgesini göster
        if (nasaModels.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        // Burada Mars'tan gelen veriyi alıyoruz ve ekranda gösteriyoruz
        final marsData = nasaModels.first; // İlk öğeyi alıyoruz, çünkü her model Mars verilerini içeriyor.

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
              bottom: 20,
              child: Column(
                children: [
                  Text(
                    "Ortalama Sıcaklık:",
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
                  Text(
                    "${marsData.the678?.AT?.av}°C", // Mars'tan gelen sıcaklık verisini buraya ekliyoruz
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
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
