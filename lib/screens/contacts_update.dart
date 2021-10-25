import 'package:bytebank2/dao/contact_dao.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:flutter/material.dart';

class ContactsUpdate extends StatefulWidget {

  final Contact contact;

  ContactsUpdate(this.contact);

  _ContactsUpdateState createState() => _ContactsUpdateState(contact);
}

class _ContactsUpdateState extends State<ContactsUpdate> {

  final Contact contact;

  _ContactsUpdateState(this.contact);

  final ContactDao _dao = ContactDao();

  Widget build(BuildContext context) {

    final TextEditingController _nomeController = TextEditingController()..text = contact.name;
    final TextEditingController _contaController = TextEditingController()..text = contact.accountNumber.toString();

    return Scaffold(
      appBar: AppBar(
        title: (Text("Update contact")),
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
                  labelText: "Full Name",
                ),
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            TextField(
              controller: _contaController,
              decoration: InputDecoration(
                labelText: "Account Number",
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
                    final Contact updateContato = Contact(contact.id, nome,conta!);
                    _dao.update(updateContato).then((id) =>  Navigator.pop(context));
                  },
                  child: Text("Update"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
