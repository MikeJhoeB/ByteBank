import 'package:bytebank2/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'components/transaction_auth_dialog.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.green.shade900,
            secondary: Colors.blueAccent.shade700,
          ),
          primaryColor: Colors.green.shade900,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(Colors.blueAccent.shade700),
            ),
          ),
        ),
        home: Dashboard());
  }
}


