import 'package:cosmic_weather_app/core/constants/design_constants.dart';
import 'package:cosmic_weather_app/view/home/presantation/home_view.dart';
import 'package:flutter/material.dart';
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
      builder:(context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        
        title: 'Flutter Demo',
        theme: ThemeData(
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeView(),
      );}


    );
  }
}
