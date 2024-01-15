class TennisCourtModel {
  final int id;
  final String name;
  final String location;
  final int maxAttendees;

  TennisCourtModel({
    required this.id,
    required this.name,
    required this.location,
    required this.maxAttendees,
  });

  factory TennisCourtModel.fromJson(Map<String, dynamic> json) {
    return TennisCourtModel(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      maxAttendees: json['maxAttendees'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'maxAttendees': maxAttendees,
    };
  }

  factory TennisCourtModel.create(
      int id, String name, String location, int maxAttendees) {
    return TennisCourtModel(
      id: id,
      name: name,
      location: location,
      maxAttendees: maxAttendees,
    );
  }
}
