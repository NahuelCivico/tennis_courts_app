import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court_app/core/service/weather_service.dart';

import 'rain_probability_state.dart';

class RainProbabilityCubit extends Cubit<RainProbabilityState> {
  final WeatherService weatherService;

  RainProbabilityCubit({required this.weatherService})
      : super(RainProbabilityInitState());

  Future<void> getRainProbability(DateTime date) async {
    try {
      await weatherService.getRainProbability(date);
      emit(RainProbabilityLoadedState(weatherService.rainProbability));
    } catch (e) {
      emit(RainProbabilityErrorState('$e'));
    }
  }

  Future<void> resetRainProbability() async {
    emit(RainProbabilityInitState());
  }
}
