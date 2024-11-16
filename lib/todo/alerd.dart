import 'package:flutter/material.dart';
import 'package:offline_app/todo/my_botton.dart';

class Alerd extends StatelessWidget {
  final VoidCallback onSave;
  final TextEditingController todoEditingController;
  const Alerd(
      {super.key, required this.todoEditingController, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        width: double.infinity,
        child: TextField(
          controller: todoEditingController,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              border: OutlineInputBorder(),
              hintText: "Add a new task"),
        ),
      ),
      actions: [
        MyBotton(text: "Creat", onPressed: onSave),
        MyBotton(
            text: "Cancel",
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    );
  }
}
