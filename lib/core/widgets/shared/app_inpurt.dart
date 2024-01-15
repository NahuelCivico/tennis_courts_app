import 'package:flutter/material.dart';

import '../../design/app_colors.dart';

class AppInput extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String errorEmptyText;

  const AppInput({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.errorEmptyText,
  }) : super(key: key);

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.displayMedium,
      controller: widget.textEditingController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        counterText: '',
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.displayMedium,
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
        return value!.trim().isEmpty
            ? 'Enter a ${widget.errorEmptyText}'
            : null;
      },
    );
  }
}
