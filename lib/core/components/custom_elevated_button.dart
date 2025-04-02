import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     width: MediaQuery.sizeOf(context).width,
height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black45.withOpacity(0.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: BorderSide(color: Colors.blueAccent.withOpacity(0.3), width: 1),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shadowColor: Colors.blueAccent.withOpacity(0.5),
          elevation: 8,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white.withOpacity(0.7,),
          
          ),
        ),
      ),
    );
  }
}
