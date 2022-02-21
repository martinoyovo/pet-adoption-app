import 'dart:convert';

List<VeterinaryDetails> packageDetailsFromJson(String str) => List<VeterinaryDetails>.from(json.decode(str).map((x) => VeterinaryDetails.fromJson(x)));

String packageDetailsToJson(List<VeterinaryDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VeterinaryDetails {
  VeterinaryDetails({
    required this.title,
    this.sub,
    this.pet,
    required this.items,
    required this.price,
  });

  final String title;
  final dynamic sub;
  final String? pet;
  final List<String> items;
  final int price;

  factory VeterinaryDetails.fromJson(Map<String, dynamic> json) => VeterinaryDetails(
    title: json["title"],
    sub: json["sub"],
    pet: json["pet"],
    items: List<String>.from(json["items"].map((x) => x)),
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "sub": sub,
    "pet": pet,
    "items": List<dynamic>.from(items.map((x) => x)),
    "price": price,
  };
}
