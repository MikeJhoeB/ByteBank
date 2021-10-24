import 'package:bytebank2/dao/contact_dao.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:flutter/material.dart';

class ContactsForm extends StatefulWidget {
  _ContactsFormState createState() => _ContactsFormState();
}

class _ContactsFormState extends State<ContactsForm> {
  final TextEditingController _nomeController = TextEditingController();

  final TextEditingController _contaController = TextEditingController();

  final ContactDao _dao = ContactDao();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text("Novo contato")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: "Nome Completo",
                ),
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            TextField(
              controller: _contaController,
              decoration: InputDecoration(
                labelText: "Número da Conta",
              ),
              style: TextStyle(fontSize: 24.0),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final String nome = _nomeController.text;
                    final int? conta = int.tryParse(_contaController.text);
                    final Contact novoContato = Contact(0, nome,conta!);
                    _dao.save(novoContato).then((id) =>  Navigator.pop(context));
                  },
                  child: Text("Criar"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
