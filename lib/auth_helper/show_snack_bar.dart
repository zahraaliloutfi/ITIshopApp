import 'package:chat_application/constants.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: kPrimaryColorOrange,
      content: Text(
        message,
      ),
    ),
  );
}
