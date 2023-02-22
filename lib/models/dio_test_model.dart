// To parse this JSON data, do
//
//     final dioModel = dioModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<DioModel> dioModelFromJson(String str) =>
    List<DioModel>.from(json.decode(str).map((x) => DioModel.fromJson(x)));

String dioModelToJson(List<DioModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DioModel {
  DioModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  int postId;
  int id;
  String name;
  String email;
  String body;

  factory DioModel.fromJson(Map<String, dynamic> json) => DioModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
