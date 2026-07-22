import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.size = 120});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.blue.shade600,
        borderRadius: BorderRadius.circular(size * 0.25),
      ),
      child: Icon(
        Icons.school_rounded,
        color: Colors.white,
        size: size * 0.55,
      ),
    );
  }
}