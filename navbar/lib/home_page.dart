import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
            // Puedes agregar más elementos de menú aquí
            // Ejemplo:
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
      body: Center(
        child: Text('Welcome to the HomePage!'),
      ),
    );
  }
}

// stateless es un widget que no cambia, no tiene estado
// scaffold es un widget que nos da una estructura de pagina
