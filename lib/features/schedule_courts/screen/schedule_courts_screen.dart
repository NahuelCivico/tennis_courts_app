import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court_app/core/helpers/app_constants.dart';
import 'package:tennis_court_app/core/widgets/shared/app_title.dart';
import 'package:intl/intl.dart';
import 'package:tennis_court_app/features/schedule_courts/cubit/rain_probability_cubit.dart';
import 'package:tennis_court_app/features/schedule_courts/widgets/molecules/schedule_courts_app_bar.dart';
import 'package:tennis_court_app/features/schedule_courts/widgets/molecules/schedule_courts_title.dart';
import 'package:tennis_court_app/features/schedule_courts/widgets/organisms/schedule_courts_chose_date.dart';
import 'package:tennis_court_app/features/tennis_courts/repository/tennis_court_repository.dart';
import '../../../core/design/app_colors.dart';
import '../../../core/service/weather_service.dart';
import '../../../core/widgets/shared/app_button.dart';
import '../../../core/widgets/shared/app_bubbles.dart';
import '../../../core/widgets/shared/app_inpurt.dart';
import '../../home/cubit/home_cubit.dart';
import '../../home/cubit/home_state.dart';

class ScheduleCourtsScreen extends StatefulWidget {
  const ScheduleCourtsScreen({super.key});

  @override
  State<ScheduleCourtsScreen> createState() => _ScheduleCourtsScreenState();
}

class _ScheduleCourtsScreenState extends State<ScheduleCourtsScreen> {
  int? selectedCourtId = 1;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final textEditingController = TextEditingController();
  final dateEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final tennisCourts = context.watch<TennisCourtRepository>().tennisCourts;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const ScheduleCourtsAppBar(),
      body: Stack(
        children: [
          const AppBubbles(),
          BlocListener<HomeCubit, HomeState>(
            listener: (context, state) {
              switch (state) {
                case HomeLoadingState():
                  break;
                case HomeLoadedState():
                  Navigator.pushNamed(context, AppConstants.home);
                  break;
                case HomeErrorState(errorMessage: String error):
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: AppTitle(
                        text: error,
                        style: Theme.of(context).textTheme.headlineMedium!,
                      ),
                      backgroundColor: AppColors.red,
                    ),
                  );
                  break;
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    const ScheduleCourtsTitle(),
                    const SizedBox(height: 20),
                    for (var tennisCourt in tennisCourts)
                      RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        title: AppTitle(
                          text:
                              '${tennisCourt.name} in ${tennisCourt.location}',
                          style: Theme.of(context).textTheme.displayMedium!,
                        ),
                        value: tennisCourt.id,
                        groupValue: selectedCourtId,
                        onChanged: (value) {
                          setState(() {
                            selectedCourtId = value;
                          });
                        },
                        activeColor: AppColors.black,
                      ),
                    const SizedBox(height: 20),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ScheduleCourtsChoseDate(
                            dateEditingController: dateEditingController,
                          ),
                          const SizedBox(height: 25),
                          AppInput(
                            textEditingController: textEditingController,
                            hintText: 'First name',
                            errorEmptyText: 'name',
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              Expanded(
                                child: AppButton(
                                  text: 'Save',
                                  onPressed: () {
                                    if (!formKey.currentState!.validate()) {
                                      return null;
                                    }
                                    context
                                        .read<HomeCubit>()
                                        .saveTennisCourtBooking(
                                          selectedCourtId!,
                                          DateFormat('MMM dd, yyyy').parse(
                                              dateEditingController.text),
                                          textEditingController.text,
                                          context
                                              .read<WeatherService>()
                                              .rainProbability,
                                        );
                                    context
                                        .read<RainProbabilityCubit>()
                                        .resetRainProbability();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
