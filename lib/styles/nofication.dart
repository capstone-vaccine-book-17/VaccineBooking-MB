import 'package:flutter/material.dart';

void snackbarMessage(BuildContext context, String msg) {
  print(msg);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(msg)),
  );
}
