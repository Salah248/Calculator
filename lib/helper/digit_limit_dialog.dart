// lib/dialogs/digit_limit_dialog.dart
import 'package:flutter/material.dart';

void showDigitLimitExceededDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Digit Limit Exceeded"),
        content:
            const Text("You can input numbers with a maximum of 15 digits."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}
