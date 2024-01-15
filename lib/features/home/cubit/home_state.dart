import '../../../core/models/tennis_court_booking_model.dart';

sealed class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<TennisCourtBookingModel> tennisCourtBookings;

  HomeLoadedState(this.tennisCourtBookings);
}

class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState(this.errorMessage);
}
