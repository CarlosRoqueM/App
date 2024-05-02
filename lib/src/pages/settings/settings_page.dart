import 'package:app/src/pages/profile/detailedProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/src/widgets/backgroundTemplate.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isCallEnabled = false;
  bool _isMessageEnabled = false;

  @override
  Widget build(BuildContext context) {
    return BackgroundTemplate(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // Tus widgets aquí
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    child: Container(
                      height: kToolbarHeight,
                      color: Colors.black.withOpacity(
                          0.5), // Agregado un color de fondo semi-transparente
                      child: Center(
                        child: Text(
                          'Settings',
                          style: GoogleFonts.poppins(
                              fontSize: 27,
                              color: Colors
                                  .white, // Cambiado a blanco para un mejor contraste
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //Limita el contenido de la página a la parte inferior de la barra de herramientas
            Padding(
              padding: EdgeInsets.only(top: kToolbarHeight - 30),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 9.0, horizontal: 20.0),
                          leading: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('assets/img/profile2.jpg')),
                          title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Mario Santisteban',
                                    style: GoogleFonts.poppins(fontSize: 18)),
                                Text('Paciente',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14, color: Colors.grey))
                              ]),
                          trailing: IconButton(
                              icon: Icon(Icons.arrow_forward_ios, size: 20),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailedProfilePage()))),
                        ),
                        SizedBox(height: 20), // Agrega un espacio de 20 píxeles
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.0), // Ajusta el valor a tu necesidad
                          child: Text(
                            'Tu Actividad',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600]),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.bookmark),
                          title: Text('Mis reservas'),
                          trailing: Icon(Icons.arrow_forward_ios, size: 20),
                          onTap: () {
                            // Navega a la página de reservas
                          },
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.favorite),
                          title: Text('Mis favoritos'),
                          trailing: Icon(Icons.arrow_forward_ios, size: 20),
                          onTap: () {
                            // Navega a la página de favoritos
                          },
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.history),
                          title: Text('Mi historial'),
                          trailing: Icon(Icons.arrow_forward_ios, size: 20),
                          onTap: () {
                            // Navega a la página de historial
                          },
                        ),
                        Divider(),

                        SizedBox(height: 20), // Agrega un espacio de 20 píxeles
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.0), // Ajusta el valor a tu necesidad
                          child: Text(
                            'Configuraciones de la cuenta',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600]),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.lock),
                          title: Text('Cambiar la contraseña'),
                          trailing: Icon(Icons.arrow_forward_ios, size: 20),
                          onTap: () {
                            // Navega a la página de reservas
                          },
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.link),
                          title: Text('Cuentas vinculadas'),
                          trailing: Icon(Icons.arrow_forward_ios, size: 20),
                          onTap: () {
                            // Navega a la página de reservas
                          },
                        ),
                        Divider(),

                        SizedBox(height: 20), // Agrega un espacio de 20 píxeles
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.0), // Ajusta el valor a tu necesidad
                          child: Text(
                            'Mas opciones',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600]),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        //Opciones de Checkbox tipo Switch
                        Divider(),
                        SwitchListTile(
                          secondary: Icon(Icons.phone),
                          title: Text('Llamadas telefónicas'),
                          value:
                              _isCallEnabled, // Debes definir esta variable en tu estado
                          onChanged: (bool? value) {
                            setState(() {
                              _isCallEnabled = value!;
                            });
                          },
                        ),
                        Divider(),
                        SwitchListTile(
                          secondary: Icon(Icons.message),
                          title: Text('Mensajes'),
                          value:
                              _isMessageEnabled, // Debes definir esta variable en tu estado
                          onChanged: (bool? value) {
                            setState(() {
                              _isMessageEnabled = value!;
                            });
                          },
                        ),
                        Divider(),

                        Container(
                          margin: EdgeInsets.only(
                              left: 10.0,
                              top: 10.0,
                              bottom:
                                  20.0), // Ajusta el valor según tus necesidades
                          child: ListTile(
                            leading: Icon(Icons.logout),
                            title: Text(
                              'Cerrar sesión',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600]),
                            ),
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/login');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
