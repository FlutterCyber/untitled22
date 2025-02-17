import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:untitled2/models/user_model.dart';
import 'package:untitled2/pages/home_page.dart';
import 'package:untitled2/services/api_service.dart';

class SignInPage extends StatefulWidget {
  static const String id = "sdfhgjhghgsadf";

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signIn() async {
    var logger = Logger();
    ApiService apiService = ApiService();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    Map<String, dynamic> data = {
      "username": email,
      "password": password,
      "expiresInMins": 30,
    };
    Response? response = await apiService.postRequest("/auth/login", data);
    UserModel userModel = UserModel.fromJson(response!.data);
    logger.i(userModel.accessToken);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HomePage(token: userModel.accessToken)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Username"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: "Password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters long";
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _signIn,
                child: Text("Sign In"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SignInPage(),
  ));
}
