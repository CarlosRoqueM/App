import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundTemplateOn extends StatelessWidget {
  final Widget child;

  const BackgroundTemplateOn({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset('assets/svg/Ellipse153.svg'),
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
