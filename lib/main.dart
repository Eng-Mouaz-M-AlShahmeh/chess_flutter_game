/// Developed by Eng Mouaz M AlShahmeh
import 'package:chess_flutter_app/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'الشطرنج',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        primaryColor: Colors.brown,
      ),
      home: const MyHomePage(title: 'الشطرنج'),
    );
  }
}
