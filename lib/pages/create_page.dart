import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:untitled2/models/my_model.dart';
import 'package:untitled2/services/api_service.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  MyModel? my_model;
  TextEditingController userIdController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  Map<String, dynamic> getBodyData() {
    int userId = int.parse(userIdController.text.trim());
    String title = titleController.text.trim();
    String body = bodyController.text.trim();
    MyModel my = MyModel(userId: userId, id: 1, title: title, body: body);
    Map<String, dynamic> data = my.toJson();
    return data;
  }

  void create() async {
    var logger = Logger();
    ApiService apiService = ApiService();
    String userid = userIdController.text.trim();
    Response? response = await apiService.postRequest("/posts", getBodyData());
    logger.i(response!.data);
    MyModel myModel = MyModel.fromJson(response.data);
    logger.e(response.statusCode);
    setState(() {
      my_model = myModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Create Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: userIdController,
            ),
            TextField(
              controller: titleController,
            ),
            TextField(
              controller: bodyController,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                create();
              },
              child: Text("Create"),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "ID: ${my_model?.id}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "User ID: ${my_model?.userId}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Title: ${my_model?.title}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Body: ${my_model?.body}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
