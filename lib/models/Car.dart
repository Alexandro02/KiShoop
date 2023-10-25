// ignore_for_file: file_names

class Car {
  final int id;
  final int year;
  final String make;
  final String model;
  final String type;

  Car({
    required this.id,
    required this.year,
    required this.make,
    required this.model,
    required this.type,
  });

  // Car.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   year = json['year'];
  //   make = json['make'];
  //   model = json['model'];
  //   type = json['type'];
  // }
}
