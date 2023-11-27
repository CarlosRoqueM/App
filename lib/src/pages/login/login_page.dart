import 'package:app/src/widgets/text_form_global.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.thirdColor,
      bottomNavigationBar: Container(
        height: 450,
        child: _textdontAccount(),
      ),
      body: Stack(
        children: [
          Column(
            children: [_tittle()],
          )
        ],
      ),
    );
  }

  //Widgets_privados

  Widget _textdontAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('You don’t have an account?',
        style: TextStyle(
          color: GlobalColors.primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.normal
        ),
      ), 
        SizedBox(width: 10),
        Text('Sign up',
          style: TextStyle(
          color: GlobalColors.secondColor,
          fontSize: 16,
          fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }

  Widget _tittle() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              'Iniciar sesion',
              style: TextStyle(
                  color: GlobalColors.primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
