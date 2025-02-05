import 'package:flutter/material.dart';

class menuPage extends StatefulWidget {
  const menuPage({super.key});

  @override
  _menuPageState createState() => _menuPageState();
}

class _menuPageState extends State<menuPage> {
  int _selectedIndex = 2; // Since this is the MenuPage, the index should be 2

  // Function to handle bottom navigation item selection
  void _onItemTapped(int index) {
    if (_selectedIndex == index) return; // Avoid unnecessary rebuilds

    setState(() {
      _selectedIndex = index;
    });

    String routeName = '';
    switch (index) {
      case 0:
        routeName = '/home';
        break;
      case 1:
        routeName = '/activities';
        break;
      case 2:
        routeName = '/menu';
        break;
      case 3:
        routeName = '/profile';
        break;
    }

    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Page')),
      body: Center(
        child: const Text('Back to Menu Page', style: TextStyle(fontSize: 24)),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.insights_outlined), label: 'My Activities'),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_rounded), label: 'Menu'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
