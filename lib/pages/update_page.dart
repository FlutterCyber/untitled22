import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:untitled2/models/my_model.dart';
import 'package:untitled2/services/api_service.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  MyModel? my_model;

  TextEditingController IDController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  Map<String, dynamic> getBodyData() {
    int id = int.parse(IDController.text.trim());
    int userId = int.parse(userIdController.text.trim());
    String title = titleController.text.trim();
    String body = bodyController.text.trim();
    MyModel my = MyModel(userId: userId, id: id, title: title, body: body);
    Map<String, dynamic> data = my.toJsonForUpdate();
    return data;
  }

  void create() async {
    var logger = Logger();
    ApiService apiService = ApiService();
    Response? response = await apiService.putRequest("/posts/3", getBodyData());
    logger.i(response!.data);
    MyModel myModel = MyModel.fromJson(response.data);
    logger.i(response.statusCode);
    setState(() {
      my_model = myModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Update Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: IDController,
              decoration: const InputDecoration(
                hintText: "ID",
              ),
            ),
            TextField(
              controller: userIdController,
              decoration: const InputDecoration(
                hintText: "User ID",
              ),
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: "Title",
              ),
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                hintText: "Body",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                create();
              },
              child: Text("Update"),
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
