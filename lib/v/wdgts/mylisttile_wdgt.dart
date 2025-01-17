import 'package:flutter/material.dart';

class MylisttileWdgt extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Widget? leading;
  final Color textColor;
  final Color backgroundColor;

  const MylisttileWdgt({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.leading,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: backgroundColor,
        margin: const EdgeInsets.all(10),
        elevation: 4,
        child: ListTile(
          leading: leading,
          title: Text(title, style: TextStyle(color: textColor)),
          subtitle: Text(subtitle, style: TextStyle(color: textColor)),
          trailing: Icon(Icons.arrow_forward, color: textColor),
        ),
      ),
    );
  }
}
