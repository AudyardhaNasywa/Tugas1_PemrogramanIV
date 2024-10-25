import 'package:flutter/material.dart';
import 'home_page.dart'; // Import Home Page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // Set Home Page sebagai halaman utama
    );
  }
}
