import 'package:flutter/material.dart';
import 'package:itrip/utils/colors_app.dart';

class ButtonLink extends StatefulWidget {
  const ButtonLink({super.key, required this.text, required this.onClick});
  final String text;
  final Function onClick;

  @override
  State<ButtonLink> createState() => _ButtonLinkState();
}

class _ButtonLinkState extends State<ButtonLink> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onClick(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.text,
            style: TextStyle(
              color: ColorsApp.primaryDarkColor, 
              fontSize: 16.0,
              decoration: TextDecoration.underline,
              decorationColor: ColorsApp.primaryDarkColor
            ),
          ),
        ],
      ),
    );
  }
}
