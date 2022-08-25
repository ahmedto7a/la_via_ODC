// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

Plant PlantFromJson(String str) => Plant.fromJson(json.decode(str));

String PlantToJson(Plant data) => json.encode(data.toJson());

class Product {
  Product({
  required  this.productId,
    required  this.name,
    required this.description,
    required this.imageUrl,
    required this.type,
    required this.price,
    required this.available,
   // this.seed,
   //  this.plant,
    // this.tool,
  });

  String productId;
  String name;
  String description;
  String imageUrl;
  String type;
  int price;
  bool available;
  // dynamic seed;
  // dynamic plant;
  // dynamic tool;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["productId"],
    name: json["name"],
    description: json["description"],
    imageUrl: json["imageUrl"],
    type: json["type"],
    price: json["price"],
    available: json["available"],
    // seed: json["seed"],
    // plant: Plant.fromJson(json["plant"]),
    // tool: json["tool"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "name": name,
    "description": description,
    "imageUrl": imageUrl,
    "type": type,
    "price": price,
    "available": available,
    // "seed": seed,
    // "plant": plant.toJson(),
    // "tool": tool,
  };
}

class Plant {
  Plant({
  required  this.plantId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.waterCapacity,
    required this.sunLight,
    required this.temperature,
  });

  String plantId;
  String name;
  String description;
  String imageUrl;
  int waterCapacity;
  int sunLight;
  int temperature;

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
    plantId: json["plantId"],
    name: json["name"],
    description: json["description"],
    imageUrl: json["imageUrl"],
    waterCapacity: json["waterCapacity"],
    sunLight: json["sunLight"],
    temperature: json["temperature"],
  );

  Map<String, dynamic> toJson() => {
    "plantId": plantId,
    "name": name,
    "description": description,
    "imageUrl": imageUrl,
    "waterCapacity": waterCapacity,
    "sunLight": sunLight,
    "temperature": temperature,
  };
}
