// To parse this JSON data, do
//
//     final seeds = seedsFromJson(jsonString);

import 'dart:convert';

Seeds seedsFromJson(String str) => Seeds.fromJson(json.decode(str));

String seedsToJson(Seeds data) => json.encode(data.toJson());

class Seeds {
  Seeds({
   required this.seedId,
    required this.name,
    required  this.description,
    required this.imageUrl,
  });

  String seedId;
  String name;
  String description;
  String imageUrl;

  factory Seeds.fromJson(Map<String, dynamic> json) => Seeds(
    seedId: json["seedId"],
    name: json["name"],
    description: json["description"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "seedId": seedId,
    "name": name,
    "description": description,
    "imageUrl": imageUrl,
  };
}
