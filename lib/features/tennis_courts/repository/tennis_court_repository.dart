import '../../../core/db/tennis_court_database.dart';
import '../../../core/models/tennis_court_model.dart';

class TennisCourtRepository {
  TennisCourtDatabase tennisCourtDatabase;
  List<TennisCourtModel> tennisCourts = [];

  TennisCourtRepository({required this.tennisCourtDatabase}) {
    loadTennisCourts();
  }

  Future<List<TennisCourtModel>> loadTennisCourts() async {
    final List<Map<String, dynamic>> response =
        await tennisCourtDatabase.getTennisCourts();
    tennisCourts = response.map((e) => TennisCourtModel.fromJson(e)).toList();
    return tennisCourts;
  }
}
