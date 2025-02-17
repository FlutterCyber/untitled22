import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:untitled2/models/user_full_model.dart';
import 'package:untitled2/models/user_model.dart';
import 'package:untitled2/pages/products_page.dart';
import 'package:untitled2/services/api_service_2.dart';

class HomePage extends StatefulWidget {
  static const String id = "ioueyrtiuwyert";
  String token;

  HomePage({super.key, required this.token});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserFullModel? userFullModel;

  getUserFullData() async {
    var logger = Logger();
    ApiService2 apiService2 = ApiService2();
    Response? response = await apiService2.getRequest('/auth/me', widget.token);
    logger.i(response);
    UserFullModel userFullModel = UserFullModel.fromJson(response!.data);
    setState(() {
      this.userFullModel = userFullModel;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserFullData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: userFullModel != null
          ? Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(userFullModel!.firstName),
                Text(userFullModel!.lastName),
                Text(userFullModel!.email),
                Text(userFullModel!.birthDate),
                Text(userFullModel!.gender),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ProductsPage.id);
                    },
                    child: const Text("Products Page"))
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
