import 'package:flutter/material.dart';

class Progress extends StatelessWidget {

  final String? message;

  Progress({this.message = "Loading"});

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Colors.blueAccent,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(message!),
          ),
        ],
      ),
    );
  }
}
