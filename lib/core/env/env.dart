import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get apiAccuWeatherBaseUrl {
    return dotenv.get('API_ACCUWEATHER_BASE_URL');
  }

  static String get apiAccuWeatherAccessKey {
    return dotenv.get('API_ACCUWEATHER_ACCESS_KEY');
  }

  static String get locationKey {
    return dotenv.get('LOCATION_KEY');
  }
}
