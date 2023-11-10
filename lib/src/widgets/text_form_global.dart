import 'package:flutter/material.dart';


class TextFormGlobal extends StatelessWidget {
  const TextFormGlobal({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.only(
        top: 5, left: 15
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        
      ),
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: 'Email',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(0),
          hintStyle: TextStyle(
            height: 1,
          )
        ),
      ),
    );
  }
}