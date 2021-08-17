import 'package:flutter/material.dart';
import 'package:the_line/models/theme.dart';
import 'package:the_line/screens/loginnew/colors.dart';

class DButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final EdgeInsets padding;

  const DButton(
      {Key key,
      this.onTap,
      this.text,
      this.padding = const EdgeInsets.all(14.0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(left: 40, right: 40),
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: onTap,
          color: colors,
          child: Center(
            child: Text(
              "SIGN IN",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
