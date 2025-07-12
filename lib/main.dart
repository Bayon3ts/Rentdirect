import 'package:flutter/material.dart';
import 'MarketplaceScreen.dart';

void main() {
  runApp(const RentDirectApp());
}

class RentDirectApp extends StatelessWidget {
  const RentDirectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RentDirect',
      theme: ThemeData(
        primaryColor: const Color(0xFF0052CC), // Customize to match your brand color
        scaffoldBackgroundColor: Colors.grey[100],
        fontFamily: 'Poppins', // Replace with your actual font
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFF0052CC),
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: const MarketplaceScreen(),
    );
  }
}
