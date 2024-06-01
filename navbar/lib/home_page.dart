import 'package:dismissible_carousel_viewpager/dismissible_carousel_viewpager.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<String> img = [
    'assets/img/cocina.jpg',
    'assets/img/lb.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color:
                      Colors.white, // Cambiado a blanco para mejor visibilidad
                  fontSize: 24, // Tamaño de fuente ajustado
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.king_bed),
              title: Text('Recámara'),
              onTap: () {
                // Acción al tocar
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.tv),
              title: Text('Sala'),
              onTap: () {
                // Acción al tocar
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.kitchen),
              title: Text('Cocina'),
              onTap: () {
                // Acción al tocar
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: DismissibleCarouselViewPager(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Center(
                    child: Image.asset(
                      img[index],
                      fit: BoxFit.cover,
                      height: 400.0, // Ajusta la altura de la imagen
                      width: 600.0, // Ajusta el ancho de la imagen
                    ),
                  ),
                );
              },
              itemCount: img.length,
            ),
          ),
          Center(
            child: Text('Welcome to the Home Page!'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
