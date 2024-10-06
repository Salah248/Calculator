import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({
    super.key,
    required this.result,
    required this.onBackspace,
    required this.onHistory,
    required this.expression, // تمرير التعبير
  });

  @override
  State<CustomContainer> createState() => _CustomContainerState();

  final String result; // الناتج
  final String expression; // التعبير
  final Function onBackspace;
  final Function onHistory;
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          alignment: Alignment.topRight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.withOpacity(.5),
          ),
        ),
        // إضافة العمليّة في الجزء العلوي
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            widget.expression, // عرض التعبير
            style: const TextStyle(
              fontSize: 30, // حجم النص للتعبير
            ),
          ),
        ),

        Container(
          margin: const EdgeInsets.only(top: 40),
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            widget.result,
            style: const TextStyle(
              fontSize: 50, // حجم النص للناتج
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: IconButton(
            onPressed: () {
              widget.onHistory(); // استدعاء الـ function الخاصة بالـ history
            },
            icon: const Icon(Icons.history),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            onPressed: () {
              setState(() {
                widget
                    .onBackspace(); // استدعاء الـ function الخاصة بالـ backspace
              });
            },
            icon: const Icon(Icons.backspace_outlined),
          ),
        ),
      ],
    );
  }
}
