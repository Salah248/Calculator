// lib/dialogs/history_dialog.dart
import 'package:flutter/material.dart';

void showHistoryDialog(BuildContext context, List<String> calculationHistory) {
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text('Calculation History'),
            content: SizedBox(
              height: 200,
              width: 300,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: calculationHistory.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(calculationHistory[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    calculationHistory.clear(); // Clear history
                  });
                },
                child: const Text("Clear History"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                },
                child: const Text("Close"),
              ),
            ],
          );
        },
      );
    },
  );
}
