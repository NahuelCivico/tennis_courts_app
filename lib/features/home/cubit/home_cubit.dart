import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository tennisCourtRepository;

  HomeCubit({required this.tennisCourtRepository}) : super(HomeLoadingState()) {
    loadTennisCourtBookings();
  }

  Future<void> loadTennisCourtBookings() async {
    try {
      emit(HomeLoadingState());
      await tennisCourtRepository.loadTennisCourtBookings();
      emit(HomeLoadedState(tennisCourtRepository.tennisCourtBookings));
    } catch (e) {
      emit(HomeErrorState('$e'));
    }
  }

  Future<void> saveTennisCourtBooking(
      int courtId, DateTime date, String userName, int rainProbability) async {
    try {
      emit(HomeLoadingState());
      await tennisCourtRepository.saveTennisCourtBooking(
          courtId, date, userName, rainProbability);
      emit(HomeLoadedState(tennisCourtRepository.tennisCourtBookings));
    } catch (e) {
      emit(HomeErrorState('$e'));
    }
  }

  Future<void> deleteTennisCourtBooking(int id) async {
    try {
      emit(HomeLoadingState());
      await tennisCourtRepository.deleteTennisCourtBooking(id);
      emit(HomeLoadedState(tennisCourtRepository.tennisCourtBookings));
    } catch (e) {
      emit(HomeErrorState('$e'));
    }
  }

  Future<void> goBackHome() async {
    emit(HomeLoadedState(tennisCourtRepository.tennisCourtBookings));
  }
}
