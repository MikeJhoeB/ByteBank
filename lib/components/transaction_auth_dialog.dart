import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {
  final String _textAlert;
  final Function(String password)? onConfirm;

  TransactionAuthDialog(this._textAlert, {@required this.onConfirm});

  State<TransactionAuthDialog> createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {

  final TextEditingController _passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget._textAlert),
      content: TextField(
        controller: _passwordController,
        maxLength: 4,
        obscureText: true,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        style: TextStyle(
          fontSize: 32.0,
          letterSpacing: 32.0,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            widget.onConfirm!(_passwordController.text);
            Navigator.pop(context);
          },
          child: Text("Confirm"),
        )
      ],
    );
  }
}
