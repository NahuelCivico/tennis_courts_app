import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court_app/core/widgets/appbar/app_appbar.dart';
import 'package:tennis_court_app/core/widgets/shared/app_circular_progress_indicator.dart';
import 'package:tennis_court_app/features/tennis_courts/widgets/organisms/tennis_court_card.dart';

import '../../../core/design/app_colors.dart';
import '../../../core/widgets/shared/app_bubbles.dart';
import '../repository/tennis_court_repository.dart';

class TennisCourtScreen extends StatelessWidget {
  const TennisCourtScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppAppBar(),
      body: Stack(
        children: [
          const AppBubbles(),
          FutureBuilder(
            future: context.read<TennisCourtRepository>().loadTennisCourts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TennisCourtCard(
                          tennisCourtModel: snapshot.data[index],
                        );
                      },
                    )
                  : const AppCircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
