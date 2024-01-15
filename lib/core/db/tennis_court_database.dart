import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tennis_court_app/core/models/tennis_court_booking_model.dart';
import '../models/tennis_court_model.dart';

class TennisCourtDatabase {
  static TennisCourtDatabase? _instance;
  TennisCourtDatabase._internal();
  static TennisCourtDatabase get instance =>
      _instance ??= TennisCourtDatabase._internal();

  Database? _database;
  Database get database => _database!;

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute(
          'ALTER TABLE tennis_bookings ADD COLUMN rainProbability INTEGER DEFAULT 0');
    }
  }

  Future<void> initDatabase() async {
    _database = await openDatabase(
      'tennis_court_database.db',
      version: 2,
      onUpgrade: _onUpgrade,
      onCreate: (database, version) {
        database.execute(
          '''
        CREATE TABLE IF NOT EXISTS tennis_courts(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            location TEXT,
            maxAttendees INTEGER
          )
        ''',
        );
        database.execute(
          '''
          CREATE TABLE IF NOT EXISTS tennis_bookings (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            courtId INTEGER,
            firstName INTEGER,
            date TEXT,
            rainProbability INTEGER DEFAULT 0,
            FOREIGN KEY (courtId) REFERENCES tennis_courts (id)
          )
        ''',
        );
      },
    );

    // Verify if there are tennis courts in the database
    final count = Sqflite.firstIntValue(
        await _database!.rawQuery('SELECT COUNT(*) FROM tennis_courts'));

    if (count == 0) {
      // There are no tennis courts in the database, insert the initial ones
      await _insertInitialTennisCourts();
    }
  }

  Future<void> _insertInitialTennisCourts() async {
    final initialCourts = [
      TennisCourtModel.create(1, 'Court A', 'Location A', 3),
      TennisCourtModel.create(2, 'Court B', 'Location B', 3),
      TennisCourtModel.create(3, 'Court C', 'Location C', 3),
    ];

    for (var tennisCourt in initialCourts) {
      await _database!.insert(
        'tennis_courts',
        tennisCourt.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<Map<String, dynamic>>> getTennisCourts() async {
    return await _database!.query('tennis_courts');
  }

  Future<List<TennisCourtBookingModel>> getAllBookings() async {
    final result = await _database!.rawQuery('''
      SELECT
        tennis_bookings.id AS bookingId,
        tennis_bookings.firstName AS firstName,
        tennis_bookings.date AS bookingDate,
        tennis_bookings.rainProbability AS rainProbability,
        tennis_courts.id AS courtId,
        tennis_courts.name AS courtName,
        tennis_courts.location AS courtLocation,
        tennis_courts.maxAttendees AS maxAttendees
      FROM tennis_bookings
      INNER JOIN tennis_courts ON tennis_bookings.courtId = tennis_courts.id
      ORDER BY tennis_bookings.date ASC
    ''');

    return result
        .map((row) {
          return TennisCourtBookingModel(
            id: row['bookingId'] as int,
            firstName: row['firstName'].toString(),
            courtId: row['courtId'] as int,
            date: DateTime.parse(row['bookingDate'] as String),
            rainProbability: row['rainProbability'] as int,
            tennisCourt: TennisCourtModel(
              id: row['courtId'] as int,
              name: row['courtName'].toString(),
              location: row['courtLocation'].toString(),
              maxAttendees: row['maxAttendees'] as int,
            ),
          );
        })
        .where((booking) =>
            booking.date.isAfter(DateTime.now().add(const Duration(days: -1))))
        .toList();
  }

  Future<void> deleteBooking(int bookingId) async {
    await _database!
        .delete('tennis_bookings', where: 'id = ?', whereArgs: [bookingId]);
  }

  Future<TennisCourtBookingModel> bookTennisCourt({
    required int courtId,
    required DateTime date,
    required String firstName,
    required int rainProbability,
  }) async {
    var tennisCourtBookingId = 0;
    final bookingsCount = Sqflite.firstIntValue(await _database!.rawQuery(
        'SELECT COUNT(*) FROM tennis_bookings WHERE courtId = ? AND date = ?',
        [courtId, _formatDate(date)]));

    final court = await getCourtById(courtId);

    if (bookingsCount! < court.maxAttendees) {
      tennisCourtBookingId = await database.insert('tennis_bookings', {
        'courtId': courtId,
        'firstName': firstName,
        'date': _formatDate(date),
        'rainProbability': rainProbability,
      });
    } else {
      throw Exception(
        'The court is full for the selected date. Please select another date.',
      );
    }

    return TennisCourtBookingModel(
      id: tennisCourtBookingId,
      firstName: firstName,
      courtId: courtId,
      date: date,
      rainProbability: rainProbability,
      tennisCourt: court,
    );
  }

  Future<TennisCourtModel> getCourtById(int courtId) async {
    final result = await _database!
        .query('tennis_courts', where: 'id = ?', whereArgs: [courtId]);

    if (result.isNotEmpty) {
      final courtMap = result.first;
      return TennisCourtModel(
        id: courtMap['id'] as int,
        name: courtMap['name'].toString(),
        location: courtMap['location'].toString(),
        maxAttendees: courtMap['maxAttendees'] as int,
      );
    } else {
      throw Exception('Court not found');
    }
  }

  Future<void> closeDatabase() async {
    await _database!.close();
  }

  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
