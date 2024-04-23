import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: DefaultTextStyle(
          style: GoogleFonts.poppins(
            fontSize: 27,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          child: Text('Settings'),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [Text('Settings Page')],
        ),
      ),
    );
  }
}
