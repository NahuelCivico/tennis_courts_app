import 'package:tennis_court_app/core/models/tennis_court_model.dart';

class TennisCourtBookingModel {
  final int id;
  final int courtId;
  final TennisCourtModel tennisCourt;
  final String firstName;
  final DateTime date;
  final int rainProbability;

  TennisCourtBookingModel({
    required this.id,
    required this.courtId,
    required this.tennisCourt,
    required this.firstName,
    required this.date,
    required this.rainProbability,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courtId': courtId,
      'firstName': firstName,
      'date': date.toIso8601String(),
    };
  }

  factory TennisCourtBookingModel.fromJson(Map<String, dynamic> json) {
    return TennisCourtBookingModel(
      id: json['id'],
      courtId: json['courtId'],
      tennisCourt: TennisCourtModel.fromJson(json['tennisCourt']),
      firstName: json['firstName'],
      date: DateTime.parse(json['date']),
      rainProbability: json['rainProbability'],
    );
  }
}
