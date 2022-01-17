import 'dart:convert';

List<Events> eventsFromJson(String str) => List<Events>.from(json.decode(str).map((x) => Events.fromJson(x)));

String eventsToJson(List<Events> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Events {
  Events({
    required this.name,
    required this.description,
    required this.dateStart,
    required this.dateEnd,
    required this.capacity,
    required this.place,
    required this.id,
  });

  String name;
  String description;
  DateTime dateStart;
  DateTime dateEnd;
  int capacity;
  int place;
  int id;

  factory Events.fromJson(Map<String, dynamic> json) => Events(
    name: json["name"],
    description: json["description"],
    dateStart: DateTime.parse(json["date_start"]),
    dateEnd: DateTime.parse(json["date_end"]),
    capacity: json["capacity"],
    place: json["place"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "date_start": dateStart.toIso8601String(),
    "date_end": dateEnd.toIso8601String(),
    "capacity": capacity,
    "place": place,
    "id": id,
  };
}
