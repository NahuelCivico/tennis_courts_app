import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tennis_court_app/features/schedule_courts/cubit/rain_probability_cubit.dart';

import '../../design/app_colors.dart';

class AppInputDate extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String errorEmptyText;

  const AppInputDate({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.errorEmptyText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      readOnly: true,
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        hintText: 'Chose date',
        hintStyle: Theme.of(context).textTheme.displayMedium,
        suffixIcon: const Icon(
          (Icons.calendar_month_outlined),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.black,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.black,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.black,
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red,
          ),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red,
          ),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        return value!.trim().isEmpty ? 'Enter a $errorEmptyText' : null;
      },
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(
              days: 4,
            ),
          ),
        );
        textEditingController.text =
            DateFormat('MMM dd, yyyy').format(date!).toString();
        // ignore: use_build_context_synchronously
        context.read<RainProbabilityCubit>().getRainProbability(date);
      },
    );
  }
}
