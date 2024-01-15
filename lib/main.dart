import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tennis_court_app/core/db/tennis_court_database.dart';
import 'package:tennis_court_app/features/home/cubit/home_repository.dart';
import 'package:tennis_court_app/features/tennis_courts/repository/tennis_court_repository.dart';

import 'core/app/tennis_court_app.dart';
import 'core/helpers/app_bloc_observer.dart';
import 'core/service/weather_service.dart';
import 'features/home/cubit/home_cubit.dart';
import 'features/schedule_courts/cubit/rain_probability_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TennisCourtDatabase.instance.initDatabase();
  await dotenv.load(fileName: '.env');
  Bloc.observer = AppBlocObserver();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WeatherService>(
          create: (context) => WeatherService(),
        ),
        RepositoryProvider<TennisCourtDatabase>(
          create: (context) => TennisCourtDatabase.instance,
        ),
        RepositoryProvider<TennisCourtRepository>(
          lazy: false,
          create: (context) => TennisCourtRepository(
            tennisCourtDatabase: context.read<TennisCourtDatabase>(),
          ),
        ),
        RepositoryProvider<HomeRepository>(
          create: (context) => HomeRepository(
            tennisCourtDatabase: context.read<TennisCourtDatabase>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit(
              tennisCourtRepository: context.read<HomeRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => RainProbabilityCubit(
              weatherService: context.read<WeatherService>(),
            ),
          ),
        ],
        child: const TennisCourtApp(),
      ),
    ),
  );
}
