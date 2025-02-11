import 'package:flutter/material.dart';
import 'package:untitled2/home_page.dart';
import 'package:untitled2/pages/create_page.dart';
import 'package:untitled2/pages/update_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const UpdatePage(),
    );
  }
}
