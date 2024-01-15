sealed class RainProbabilityState {}

class RainProbabilityInitState extends RainProbabilityState {}

class RainProbabilityLoadedState extends RainProbabilityState {
  final int rainProbability;

  RainProbabilityLoadedState(this.rainProbability);
}

class RainProbabilityErrorState extends RainProbabilityState {
  final String errorMessage;

  RainProbabilityErrorState(this.errorMessage);
}
