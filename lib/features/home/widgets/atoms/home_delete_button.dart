import 'package:flutter/material.dart';
import 'package:tennis_court_app/features/home/widgets/organisms/home_delete_dialog.dart';

class HomeCardDeleteButton extends StatelessWidget {
  final int id;

  const HomeCardDeleteButton({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return HomeDeleteDialog(id: id);
          },
        );
      },
    );
  }
}
