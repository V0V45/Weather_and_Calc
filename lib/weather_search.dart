import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  int _selectedIndex = 1;

  void changeBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.of(context).pushReplacementNamed('/search');
      } else if (index == 0) {
        Navigator.of(context).pushReplacementNamed('/');
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Search'), backgroundColor: Colors.orange),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Weather'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search')
        ],
        currentIndex: _selectedIndex,
        onTap: changeBottomBar,
      ),
    );
  }
}
