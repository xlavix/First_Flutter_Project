import 'package:flutter/material.dart';
import 'pages/halaman_daftar_negara.dart';
import 'pages/halaman_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi 3 Halaman',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const NavigasiBawah(),
    );
  }
}

class NavigasiBawah extends StatefulWidget {
  const NavigasiBawah({super.key});

  @override
  State<NavigasiBawah> createState() => _NavigasiBawahState();
}

class _NavigasiBawahState extends State<NavigasiBawah> {
  int _selectedIndex = 0;

  final List<Widget> _halaman = [
    HalamanDaftarNegara(),
    HalamanProfile(),
  ];

  final List<String> _judulHalaman = [
    'Daftar Negara',
    'Profile',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<BottomNavigationBarItem> _navItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.flag), label: 'Negara'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_judulHalaman[_selectedIndex]),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: _halaman[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _navItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
      ),
    );
  }
}