import 'package:flutter/material.dart';
import 'package:the_to_do_app/utils/my_buttons.dart';

class DialogueBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogueBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[300],
      content: Container(
        height: 150,
        width: 300,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Add a new task'),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButton(text: 'Save', onPressed: onSave),
                MyButton(text: 'Cancel', onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
