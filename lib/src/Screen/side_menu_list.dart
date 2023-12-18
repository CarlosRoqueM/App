import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideMenuList extends StatelessWidget {
  const SideMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
      child: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              minRadius: 17,
              maxRadius: 20,
              backgroundImage: AssetImage('assets/img/profile2.jpg'),
            ),
            title: Text(
              'Carlos Roque',
              style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            subtitle: Text(
              'carlos.roque@gmail.com',
              style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 18,
          ),
          buttonDecoration(
            name: 'Enfermeros',
            iconData: Icons.person,
            boxColor: Colors.transparent,
            onTap: () {},
          ),
          SizedBox(
            height: 35,
          ),
          buttonDecoration(
            name: 'Politicas y Privacidad',
            iconData: Icons.privacy_tip,
            boxColor: Colors.transparent,
            onTap: () {},
          ),
          SizedBox(
            height: 35,
          ),
          buttonDecoration(
            name: 'Centro de ayuda',
            iconData: Icons.help,
            boxColor: Colors.transparent,
            onTap: () {},
          ),
          SizedBox(
            height: 35,
          ),
          buttonDecoration(
            name: 'Configuracion',
            iconData: Icons.settings,
            boxColor: Colors.transparent,
            onTap: () {},
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    size: 28,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Cerrar Sesion',
                    style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  buttonDecoration({
    required String name,
    required IconData iconData,
    required VoidCallback onTap,
    required Color boxColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: boxColor),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 28,
              color: Colors.white,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              name,
              style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
