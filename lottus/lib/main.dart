import 'package:flutter/material.dart';
import 'home_screen.dart';
// Importamos la vista de login
import 'package:lottus/vistas/a.dart';
import 'profile_screen.dart';
import 'shopping_card.dart';
import 'special_price.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(), // Cambia la pantalla principal a LoginScreen
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    ShoppingCardScreen(),
    SpecialPriceScreen(),
    ProfileScreen(),
    MakeupScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Cierra el drawer cuando se selecciona un item
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shopping Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Special Price',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: const Text('Shopping Card'),
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
              title: const Text('Special Price'),
              onTap: () => _onItemTapped(2),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () => _onItemTapped(3),
            ),
            ListTile(
              leading: Icon(Icons.brush),
              title: const Text('Makeup'),
              onTap: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }
}

// Your existing screens
class ShoppingCardScreen extends StatelessWidget {
  const ShoppingCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Card'),
      ),
      body: const Center(
        child: Text('Shopping Card Screen'),
      ),
    );
  }
}

class SpecialPriceScreen extends StatelessWidget {
  const SpecialPriceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Special Price'),
      ),
      body: const Center(
        child: Text('Special Price Screen'),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}

// Additional sections
class MakeupScreen extends StatelessWidget {
  const MakeupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Makeup'),
      ),
      body: const Center(
        child: Text('Makeup Screen'),
      ),
    );
  }
}
