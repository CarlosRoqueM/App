import 'package:app/src/widgets/Backgroundtemplate.dart';
import 'package:app/utils/global_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/src/pages/favorite/card_model.dart';

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: GlobalColors.primaryColor,
  minimumSize: Size(40, 20), // Reducir el tamaño mínimo del botón
  padding: const EdgeInsets.symmetric(
      horizontal: 8, vertical: 4), // Reducir el padding del botón
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
);

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  CardModel cardModel = CardModel();

  @override
  Widget build(BuildContext context) {
    return BackgroundTemplate(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            _buildPageContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 18),
          _buildSearchField(),
          const SizedBox(height: 18),
          _buildCardList(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Busca enfermeros',
              style: GoogleFonts.poppins(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Encuentra enfermeros cerca de ti',
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Color.fromRGBO(103, 114, 148, 16),
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchField() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(240, 240, 240, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        autofocus: false,
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          hintText: 'Buscar...',
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
    );
  }

  Widget _buildCardList() {
    return Column(
      children: [
        _buildCard('Lucas Jazmin', 'Santa Anita', 'assets/img/profile2.jpg', 5),
        SizedBox(height: 7),
        _buildCard(
            'Lucas Jazmin', 'Santa Anita', 'assets/img/enfermera.jpg', 5),
        SizedBox(height: 7),
        _buildCard('Lucas Jazmin', 'Santa Anita', 'assets/img/profile2.jpg', 5),
        // Agrega más tarjetas según sea necesario
      ],
    );
  }

  Widget _buildCard(
      String name, String location, String imageUrl, double rating) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _buildCardImage(imageUrl),
                    SizedBox(width: 1),
                    _buildCardInfo(name, rating),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 4),
                _buildCardFooter(),
              ],
            ),
            Positioned(
              top: 10,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.favorite),
                color: cardModel.isFavorite ? Colors.red : null,
                onPressed: () {
                  setState(() {
                    cardModel.isFavorite = !cardModel.isFavorite;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCardImage(String imageUrl) {
    return Container(
      width: 100.0,
      height: 70.0,
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(2.0),
          topRight: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          bottomLeft: Radius.circular(0.0),
        ),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildCardInfo(String name, double rating) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
              fontFamily: 'Poppins', // Estilo de fuente Poppins
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            '${rating.round()} años de experiencia', // Años de experiencia como valor entero
            style: TextStyle(
              fontFamily: 'Poppins', // Estilo de fuente Poppins
            ),
          ),
          SizedBox(
              height:
                  10.0), // Espacio entre "años de experiencia" y las estrellas
          Row(
            children: List.generate(
              rating.round(),
              (index) => Icon(Icons.star, color: Colors.yellow),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardFooter() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0), // Añadido padding a la izquierda
      child: Row(
        children: <Widget>[
          Text(
            'Disponible',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          ElevatedButton(
            style: raisedButtonStyle,
            onPressed: () {},
            child: Text(
              'Reservar',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
