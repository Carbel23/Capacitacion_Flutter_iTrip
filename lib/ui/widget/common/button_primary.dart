import 'package:flutter/material.dart';

class ButtonPrimary extends StatefulWidget {
  const ButtonPrimary({super.key, required this.onClick, required this.text});
  final String text;
  final Function onClick;

  @override
  State<ButtonPrimary> createState() => _ButtonPrimaryState();
}

class _ButtonPrimaryState extends State<ButtonPrimary> {
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Color(0xFF008FC8)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
        ),
      ),
      onPressed: () => widget.onClick(),
      child: Text(
        widget.text,
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      ),
      // 
    );
  }
}
