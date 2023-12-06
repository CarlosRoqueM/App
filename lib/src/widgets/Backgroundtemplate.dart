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
            child: SvgPicture.asset('assets/svg/svg1.svg'),
          ),
          child,
          BackdropFilter(filter: ui.ImageFilter.blur(
            sigmaX: 90.0,
            sigmaY: 90.0
          ),
          child: Container(
            color: Colors.transparent,
          )),
          Align(
            alignment: Alignment.bottomRight,
            child: Transform.rotate(
              angle: 180 * 3.1416 / 180,
              child: SvgPicture.asset('assets/svg/Ellipse142.svg'),
            ),
          ),
          child,
          child,
          BackdropFilter(filter: ui.ImageFilter.blur(
            sigmaX: 90.0,
            sigmaY: 90.0,
          ),
          child: Container(
            color: Colors.transparent,
          )),
          child,
        ],
      ),
    );
  }
}
