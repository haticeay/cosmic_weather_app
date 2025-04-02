import 'package:cosmic_weather_app/assets.dart';
import 'package:flutter/material.dart';

class MarsContainer extends StatelessWidget {
  const MarsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
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
      child: Text(
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
    ),
  ],
);
    
    
    
    
    
    
    
   
  }
}