import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;

class BackgroundTemplate extends StatelessWidget {
  final Widget child;
  const BackgroundTemplate({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Añade un color de fondo a la Stack
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset('assets/img/blurARI.png'),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset('assets/img/blurAD.png'),
          ),
          child,
        ],
      ),
    );
  }
}
