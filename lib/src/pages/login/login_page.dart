import 'package:app/src/widgets/text_form_global.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.thirdColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(35.0),
            child: Column(
              children: [
                Text(
                  'Iniciar Sesion',
                  style: TextStyle(
                    color: GlobalColors.primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 135),
                
                Text(
                  'Email',
                  style: TextStyle(
                    color: GlobalColors.primaryColor,
                    fontSize:18,
                    fontWeight: FontWeight.normal
                    
                  ),
                ),
                const SizedBox(height: 10),
                TextFormGlobal(controller: emailController),
              ],
            ),
          )
        ),
      ),
    );
  }
}
