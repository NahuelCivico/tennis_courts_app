import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tennis_court_app/core/env/env.dart';

class WeatherService {
  int rainProbability = 0;

  Future<int> getRainProbability(DateTime date) async {
    final endpoint = Env.apiAccuWeatherBaseUrl;
    final response = await http.get(
      Uri.parse(
          '$endpoint/daily/5day/${Env.locationKey}?apikey=${Env.apiAccuWeatherAccessKey}&details=true'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final forecasts = data['DailyForecasts'] as List<dynamic>;
      final forecast = forecasts.firstWhere(
        (element) {
          final forecastDate = DateTime.parse(element['Date']);
          return forecastDate.year == date.year &&
              forecastDate.month == date.month &&
              forecastDate.day == date.day;
        },
        orElse: () => null,
      );
      rainProbability = forecast['Day']['RainProbability'];
    }
    return rainProbability;
  }
}
