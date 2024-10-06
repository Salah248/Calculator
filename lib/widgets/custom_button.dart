// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.color,
    this.backgroundColor,
  });

  final String text;
  final VoidCallback? onTap;
  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: backgroundColor ?? Colors.grey.withOpacity(.3),
        radius: 40, // Increased radius for larger buttons
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: color ?? Colors.white,
              fontSize: 36, // Increased font size for larger text
            ),
          ),
        ),
      ),
    );
  }
}
