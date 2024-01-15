import '../../../core/db/tennis_court_database.dart';
import '../../../core/models/tennis_court_booking_model.dart';

class HomeRepository {
  List<TennisCourtBookingModel> tennisCourtBookings = [];
  TennisCourtDatabase tennisCourtDatabase;

  HomeRepository({required this.tennisCourtDatabase});

  Future<List<TennisCourtBookingModel>> loadTennisCourtBookings() async {
    tennisCourtBookings = await tennisCourtDatabase.getAllBookings();
    return tennisCourtBookings;
  }

  Future<TennisCourtBookingModel> saveTennisCourtBooking(
      int courtId, DateTime date, String userName, int rainProbability) async {
    final booking = await tennisCourtDatabase.bookTennisCourt(
      courtId: courtId,
      date: date,
      firstName: userName,
      rainProbability: rainProbability,
    );
    tennisCourtBookings.add(booking);
    tennisCourtBookings.sort((a, b) => a.date.compareTo(b.date));
    return booking;
  }

  Future<void> deleteTennisCourtBooking(int bookingId) async {
    tennisCourtBookings.removeWhere((element) => element.id == bookingId);
    await tennisCourtDatabase.deleteBooking(bookingId);
  }
}
