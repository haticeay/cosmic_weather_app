import 'package:cosmic_weather_app/core/constants/design_constants.dart';
import 'package:cosmic_weather_app/core/cubit/nasa_data_cubit.dart';
import 'package:cosmic_weather_app/core/cubit/weather_cubit.dart';
import 'package:cosmic_weather_app/view/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: DesignConstants.defaultSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GetNasaCubit(),
              ),
              BlocProvider(
                create: (context) => WeatherCubit(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Cosmic Weather App',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: SplashView(),
            ),
          );
        });
  }
}
