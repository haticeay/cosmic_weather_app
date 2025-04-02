import 'package:cosmic_weather_app/core/components/custom_drop_down_button.dart';
import 'package:cosmic_weather_app/core/constants/app_space.dart';
import 'package:cosmic_weather_app/view/home/widget/mars_container.dart';
import 'package:cosmic_weather_app/view/home/widget/world_container.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.blueGrey.shade400,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppSpace.vertical.space50,
            AppSpace.vertical.space24,
            CustomDropdown(
              hint: 'Seçim Yapın',
              items: ['Dünya', 'Mars', 'Venüs', 'Jüpiter'],
              onChanged: (value) {
                print('Seçilen: $value');
              },
            ),
            AppSpace.vertical.space24,
            WorldContainer(),
            AppSpace.vertical.space24,
            MarsContainer(),
          ],
        ),
      ),
    );
  }
}
