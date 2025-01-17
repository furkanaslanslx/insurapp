import 'package:flutter/material.dart';

class MybttnWdgt extends StatelessWidget {
  const MybttnWdgt({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.textStyle,
  });
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: textStyle ??
            const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
      ),
    );
  }
}
