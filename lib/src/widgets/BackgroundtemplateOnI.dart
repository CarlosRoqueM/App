import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundTemplateOnI extends StatelessWidget {
  final Widget child;

  const BackgroundTemplateOnI({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset('assets/img/blurARD.png'),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
                'assets/img/realbg.png'), // Utiliza el SVG desenfocado
          ),
          child,
        ],
      ),
    );
  }
}
