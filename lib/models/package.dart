import 'dart:convert';

List<Package> packageFromJson(String str) => List<Package>.from(json.decode(str).map((x) => Package.fromJson(x)));

String packageToJson(List<Package> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Package {
  Package({
    required this.name,
    required this.services,
    required this.bonus,
    required this.price,
  });

  final String name;
  final int services;
  final int bonus;
  final int price;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
    name: json["name"],
    services: json["services"],
    bonus: json["bonus"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "services": services,
    "bonus": bonus,
    "price": price,
  };
}
