import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final BuildContext context;
  final String message;
  final Widget? icon;

  const CustomSnackBar(
      {super.key, required this.context, required this.message, this.icon});

  void showSnackBar() {
    final snackBar = SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      width: 300,
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8,
      ),
      behavior: SnackBarBehavior.floating,
      content: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black87, fontSize: 16)),
      ),
      backgroundColor: Colors.white,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
    );
  }
}
