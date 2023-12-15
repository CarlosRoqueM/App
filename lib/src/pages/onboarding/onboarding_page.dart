import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/src/widgets/BackgroundtemplateOn.dart';
import 'package:app/src/widgets/BackgroundtemplateOnI.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          _OnboardingPages(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 90.0), // Ajusta la cantidad de espacio aquí
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      GlobalColors.primaryColor),
                  padding: MaterialStateProperty.resolveWith<EdgeInsets>(
                    (states) {
                      return const EdgeInsets.symmetric(
                          horizontal: 125.0, vertical: 20.0);
                    },
                  ),
                  shape:
                      MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
                    (states) {
                      return RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      );
                    },
                  ),
                ),
                child: const Text('Siguiente', style: TextStyle(fontSize: 20)),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingPages extends StatelessWidget {
  const _OnboardingPages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        BackgroundTemplateOn(
          child: Container(
            color: Colors.transparent
            ),
        ),
        BackgroundTemplateOnI(
          child: Container(color: Colors.transparent),
        ),
        BackgroundTemplateOn(
          child: Container(color: Colors.transparent),
        ),
      ],
    );
  }
}
