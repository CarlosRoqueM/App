import 'package:app/src/models/rol.dart';
import 'package:app/src/models/user.dart';
import 'package:app/src/pages/client/Search/searchPage.dart';
import 'package:app/src/pages/client/home/home_controller.dart';
import 'package:app/src/pages/profile/profileNurse_page.dart';
import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatelessWidget {
  HomeController cont = Get.put(HomeController());
  //HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  DefaultTabController(
      length: cont.nurses.length,
      child: BackgroundTemplate( 
        child: Scaffold(
          backgroundColor: Colors.transparent,
            body: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                'Home',
                                style: GoogleFonts.poppins(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  ),
                                ),
              
                                Text(
                                'Busca enfermeros',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Color.fromRGBO(103, 114, 148, 16),
                                  fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ]
                            ),
                            //De momento este icono esta haciendo como boton de cerrar sesion.
                            GestureDetector(
                              child:  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(cont.user.value.image ?? '')),
                              
                              ),
                            ]),
                            SizedBox(
                                height: 18,
                              ),
                              Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(240, 240, 240, 1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: GestureDetector(
                                onTap: () => {
                                  // Implementa la lógica para buscar aquí
                                  cont.goToSearchPage(),
                                },
                                child: TextFormField(
                                  autofocus: false,
                                  
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    hintText: 'Buscar ....',
                                    enabled: false,
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(18),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Color.fromRGBO(103, 114, 148, 16),
                                    ),
                                    hintStyle: TextStyle(
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ], 
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.all(12),
                   child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enfermeros Populares',
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                // Implementa la lógica para ver más aquí
                              },
                                child: Text(
                                  'Ver más',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                            ),
                        ],
                      ),
                ),
                // Lista de tarjetas horizontales
                Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List<Widget>.generate(cont.nurses.length, (index) {
                          // Tarjetas "Enfermeros Populares"
                          return Obx(() =>  GestureDetector(
                            onTap: () {
                              Get.to(ProfileNursePage());
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 15),
                              width: 200,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      cont.nurses[index].image ?? '',
                                      height: 120,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children:[ 
                                        Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${cont.nurses[index].name} ${cont.nurses[index].lastname1}',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                cont.nurses[index].location ?? '',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                            ),
                                          Container(
                                            padding: const EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                
                                                borderRadius: BorderRadius.circular(5), // Ajusta el valor según lo redondeado que desees
                                                color: Colors.black,
                                              ),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Color.fromRGBO(252, 252, 252, 1),
                                                    size: 14,
                                                  ),
                                                  const SizedBox(
                                                    width: 3,
                                                  ),
                                                  Text(
                                                    '4.5',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.normal,
                                                      color: const Color.fromRGBO(252, 252, 252, 1), // Color del texto
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                            ],
                                          ),
                                  ),
                                      ],
                                    ),
                                  ),
                          )
                        );
                        }).toList(),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 12, left: 12),
                    child: const Divider(
                      //thickness: 10,
                      color: Color.fromRGBO(103, 114, 148, 16),
                    ),
                  ),
                  // Row con "Enfermeros Populares" y "Ver más"
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nuevos enfermeros',
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Implementa la lógica para ver más aquí
                          },
                          child: Text(
                            'Ver más',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:List<Widget>.generate(cont.nurses.length, (index) {
                          // Tarjetas "Enfermeros Populares"
                          return Obx(() =>  GestureDetector(
                            onTap: () {
                              Get.to(ProfileNursePage());
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 15),
                              width: 200,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      cont.nurses[index].image ?? '',
                                      height: 120,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children:[ 
                                        Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${cont.nurses[index].name} ${cont.nurses[index].lastname1}',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                cont.nurses[index].location ?? '',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                            ),
                                          Container(
                                            padding: const EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                
                                                borderRadius: BorderRadius.circular(5), // Ajusta el valor según lo redondeado que desees
                                                color: Colors.black,
                                              ),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Color.fromRGBO(252, 252, 252, 1),
                                                    size: 14,
                                                  ),
                                                  const SizedBox(
                                                    width: 3,
                                                  ),
                                                  Text(
                                                    '4.5',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.normal,
                                                      color: const Color.fromRGBO(252, 252, 252, 1), // Color del texto
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                            ],
                                          ),
                                  ),
                                      ],
                                    ),
                                  ),
                          )
                        );
                        }).toList(),
                      ),
                    ),
                  ),
                      ]),
                    ),
                  ),
            ),
          );
 
      }
}

      /*child: AppBar(
                
                bottom: TabBar(
              
                  isScrollable: true,
                  indicatorColor: Colors.green,
                  unselectedLabelColor: Colors.black,
                  tabs: List<Widget>.generate(cont.roles.length, (index) {
                    return Tab(
                      child: Text(
                        cont.roles[index].name ?? ''),
                    );
                  }),
              
                ),
              ),
            ),
          ),*
          body: TabBarView(
            children: cont.roles.map((Rol rol) {
              // Implementa la lógica para mostrar la vista de cada rol aquí
              return FutureBuilder(
                future: cont.getUsers(rol.id ?? ''), 
                builder: (context, AsyncSnapshot<List<User>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder:  (_, index) {
                        return _buildSmallCard(snapshot.data![index], 2.5);
                  });
                  } else {
                    return Container();
                  }
            });}).toList(),*/
 


