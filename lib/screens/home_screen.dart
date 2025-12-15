import 'package:flutter/material.dart';

import 'content_screen.dart';       
import 'guide_screen.dart';         
import 'profile_screen.dart';       

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const ContentScreen(),  
    const GuideScreen(),    
     ProfileScreen(),  
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.waving_hand),
            label: 'Guide', 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile', 
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF0D47A1), 
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}