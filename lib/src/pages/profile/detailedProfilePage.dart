import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailedProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: GlobalColors.primaryColor,
      minimumSize: Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 18),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );

    double width = MediaQuery.of(context).size.width; // Ancho de la pantalla

    return Stack(
      children: [
        BackgroundTemplate(
          child: Container(),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: width, // Ancho del contenedor
                    height: 357, // Altura del contenedor
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                            30), // Radio del borde inferior izquierdo
                        bottomRight: Radius.circular(
                            30), // Radio del borde inferior derecho
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/img/top.png"), // Asegúrate de que esta imagen esté en tu carpeta de assets
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      AppBar(
                        automaticallyImplyLeading:
                            false, // Esto elimina el botón de retroceso
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        title: Text('Perfil',
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 20)),
                        leading: IconButton(
                          // Agrega un botón de retroceso
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      Center(
                        child: Text('Edita tu Perfil',
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 18)),
                      ),
                      SizedBox(height: 20), // Espacio entre los dos textos
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 75, // El radio del avatar circular
                            backgroundImage: AssetImage(
                                "assets/img/profile2.jpg"), // Asegúrate de que esta imagen esté en tu carpeta de assets
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                              child: IconButton(
                                icon: Icon(Icons.edit, color: Colors.black),
                                onPressed: () {
                                  // Aquí puedes manejar la lógica para editar la imagen
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              // Aquí puedes comenzar a agregar tu contenido debajo del CircleAvatar
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Información personal',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Color.fromRGBO(103, 114, 148, 16)),
                        ),
                        child: TextField(
                          controller: TextEditingController(
                              text: 'Mario Santisteban'), // Nombre por defecto
                          enabled:
                              false, // Hace que el campo de texto no sea editable
                          style: TextStyle(
                              color: Colors.black), // Color del texto a negro
                          decoration: InputDecoration(
                            hintText: 'Nombre',
                            hintStyle: TextStyle(
                              height: 1,
                              color: Colors
                                  .black, // Color del texto de sugerencia a negro
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(18),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16), // Espacio entre los campos de texto
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Color.fromRGBO(103, 114, 148, 16)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Número de teléfono',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(18),
                            hintStyle: TextStyle(
                              height: 1,
                            ),
                            suffixIcon: Icon(
                              // Icono de editar a la derecha
                              Icons.edit,
                              color: Color.fromRGBO(103, 114, 148, 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16), // Espacio entre los campos de texto
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Color.fromRGBO(103, 114, 148, 16)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Correo Electrónico',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(18),
                            hintStyle: TextStyle(
                              height: 1,
                            ),
                            suffixIcon: Icon(
                              // Icono de editar a la derecha
                              Icons.edit,
                              color: Color.fromRGBO(103, 114, 148, 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 26), // Espacio entre los campos de texto
                    ElevatedButton(
                      style: raisedButtonStyle,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Confirmación'),
                              content: Text(
                                  '¿Estás seguro de realizar los cambios?'),
                              actions: [
                                TextButton(
                                  child: Text('No'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('Sí'),
                                  onPressed: () {
                                    // Aquí puedes poner el código para guardar los cambios
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        'Guardar',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
