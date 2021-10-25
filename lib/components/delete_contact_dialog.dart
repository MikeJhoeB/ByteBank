import 'package:flutter/material.dart';

class DeleteContactDialog extends StatelessWidget {
  final String _textAlert;
  final Function? onConfirm;

  DeleteContactDialog(this._textAlert, {@required this.onConfirm});

  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_textAlert),
      actions: <Widget>[
        TextButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text(
            "Delete",
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            onConfirm!();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
