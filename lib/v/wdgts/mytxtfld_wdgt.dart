import 'package:flutter/material.dart';

class MytxtfldWdgt extends StatefulWidget {
  const MytxtfldWdgt({
    super.key,
    required this.controller,
    this.type = TextInputType.none,
    this.obscureText = false,
    required this.hint,
    this.color = Colors.grey,
    required this.validator,
  });
  final String? Function(String?) validator;
  final bool obscureText;
  final String hint;
  final Color color;
  final TextEditingController controller;
  final TextInputType type;
  @override
  State<MytxtfldWdgt> createState() => _MytxtfldWdgtState();
}

class _MytxtfldWdgtState extends State<MytxtfldWdgt> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      validator: widget.validator,
      keyboardType: widget.type,
      style: TextStyle(color: widget.color),
      cursorColor: widget.color,
      decoration: InputDecoration(
        hintText: widget.hint,
        isDense: true,
        border: OutlineInputBorder(borderSide: BorderSide(color: widget.color)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: widget.color)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: widget.color)),
      ),
    );
  }
}
