import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court_app/core/widgets/appbar/app_appbar.dart';
import 'package:tennis_court_app/core/widgets/drawer/app_drawer.dart';
import 'package:tennis_court_app/core/widgets/shared/app_floating_action_button.dart';
import 'package:tennis_court_app/core/widgets/shared/app_title.dart';
import 'package:tennis_court_app/features/home/cubit/home_cubit.dart';
import 'package:tennis_court_app/features/home/cubit/home_state.dart';

import '../../../core/design/app_colors.dart';
import '../../../core/models/tennis_court_booking_model.dart';
import '../../../core/widgets/shared/app_bubbles.dart';
import '../widgets/organisms/home_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppAppBar(),
      drawer: const AppDrawer(),
      floatingActionButton: const AppFloatingActionButton(),
      body: Stack(
        children: [
          const AppBubbles(),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              switch (state) {
                case HomeLoadingState():
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case HomeLoadedState(
                    tennisCourtBookings: List<TennisCourtBookingModel>
                        tennisCourtBookings
                  ):
                  if (tennisCourtBookings.isEmpty) {
                    return Center(
                      child: AppTitle(
                        text: 'There are no bookings yet',
                        style: Theme.of(context).textTheme.displayMedium!,
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: (state).tennisCourtBookings.length,
                    itemBuilder: (BuildContext context, int index) {
                      return HomeCard(
                        tennisCourtBookingModel: tennisCourtBookings[index],
                      );
                    },
                  );
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
