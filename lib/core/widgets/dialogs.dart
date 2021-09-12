import 'package:flutter/material.dart';

class Dialogs {
  static buildSnackBar(
    BuildContext context,
    String text, {
    int duration = 3,
  }) {
    final SnackBar snackBar = SnackBar(
      content: Text(text),
      duration: Duration(seconds: duration),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
