import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:untitled2/models/my_model.dart';
import 'package:untitled2/services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MyModel>? my_models;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    var logger = Logger();
    ApiService apiService = ApiService();
    Response? response = await apiService.getRequest("/posts");
    List<MyModel> myModels = listFromJson(response!.data);
    setState(() {
      my_models = myModels;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: SizedBox(
          width: double.infinity,
          child: Padding(
              padding: EdgeInsets.all(20),
              child: my_models == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: my_models?.length,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(bottom: 10),
                        color: Colors.grey,
                        child: ListTile(
                          title: Row(
                            children: [
                              Text(my_models![index].id.toString()),
                              Text(my_models![index].title),
                            ],
                          ),
                          subtitle: Text(my_models![index].body),
                        ),
                      ),
                    ))),
    );
  }
}
