import 'package:flutter/material.dart';

class insightPage extends StatefulWidget {
  const insightPage({super.key});

  @override
  _insightPageState createState() => _insightPageState();
}

class _insightPageState extends State<insightPage> {
  int _selectedIndex =
      1; // Since this is the InsightPage, the index should be 1

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
      appBar: AppBar(
        title: const Text('Insight Page'),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 22, 89, 83),
      ),
      body: Center(
        child:
            const Text('Back to Insight Page', style: TextStyle(fontSize: 24)),
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.orange,
          unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
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
