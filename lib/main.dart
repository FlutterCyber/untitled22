import 'package:flutter/material.dart';
import 'package:untitled2/pages/home_page.dart';
import 'package:untitled2/pages/products_page.dart';
import 'package:untitled2/pages/sign_in_page.dart';

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
      home: SignInPage(),
      routes: {
        SignInPage.id: (context) => SignInPage(),
        ProductsPage.id: (context) => ProductsPage(),
      },
    );
  }
}
