import 'package:cosmic_weather_app/core/components/custom_drop_down_button.dart';
import 'package:cosmic_weather_app/core/components/custom_elevated_button.dart';
import 'package:cosmic_weather_app/core/constants/app_space.dart';
import 'package:cosmic_weather_app/core/constants/city_list.dart';
import 'package:cosmic_weather_app/core/cubit/nasa_data_cubit.dart';
import 'package:cosmic_weather_app/core/cubit/weather_cubit.dart';
import 'package:cosmic_weather_app/view/home/widget/mars_container.dart';
import 'package:cosmic_weather_app/view/home/widget/world_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? selectedCity = "Istanbul";
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
            AppSpace.vertical.space50,
            CustomDropdown(
              hint: 'Istanbul',
              items: CityList.turkishCities,
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                                    context
                      .read<WeatherCubit>()
                      .fetchWeather(selectedCity ?? "Istanbul");
                });
              },
            ),
            AppSpace.vertical.space32,
            WorldContainer(),
            AppSpace.vertical.space24,
            MarsContainer(),
            AppSpace.vertical.space24,
            CustomElevatedButton(
                text: "Yenile",
                onPressed: () {
                  context.read<GetNasaCubit>().getNasa();
                  context
                      .read<WeatherCubit>()
                      .fetchWeather(selectedCity ?? "Istanbul");
                })
          ],
        ),
      ),
    );
  }
}
