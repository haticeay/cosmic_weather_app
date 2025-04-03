import 'dart:async';
import 'package:cosmic_weather_app/assets.dart';
import 'package:cosmic_weather_app/core/cubit/nasa_data_cubit.dart';
import 'package:cosmic_weather_app/core/cubit/weather_cubit.dart';
import 'package:cosmic_weather_app/view/home/presantation/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
     context.read<GetNasaCubit>().getNasa();
    context.read<WeatherCubit>().fetchWeather("Istanbul");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeView(),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A121D),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.image.imSplashJPEG,
            height: MediaQuery.of(context).size.height,
            
            ) // Dosya yolunu kontrol et!
          ],
        ),
      ),
    );
  }
}
