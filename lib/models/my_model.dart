import 'dart:convert';

class MyModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  MyModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // Convert JSON to PostModel instance
  MyModel.fromJson(Map<String, dynamic> json)
      : userId = json['userId'] ?? "",
        id = json['id'] ?? "",
        title = json['title'] ?? "",
        body = json['body'] ?? "";

// Convert PostModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}

// Convert List of JSON objects to List of MyModel
List<MyModel> listFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => MyModel.fromJson(json)).toList();
}

// Convert List of PostModel to JSON List
List<Map<String, dynamic>> listToJson(List<MyModel> posts) {
  return posts.map((post) => post.toJson()).toList();
}
