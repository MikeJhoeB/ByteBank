import 'package:bytebank2/components/delete_contact_dialog.dart';
import 'package:bytebank2/components/progress.dart';
import 'package:bytebank2/dao/contact_dao.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:bytebank2/screens/forms/contacts_form.dart';
import 'package:bytebank2/screens/contacts_update.dart';
import 'package:bytebank2/screens/forms/transaction_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final String _deleteText = "Deseja realmente apagar esse contato?";
  final ContactDao _dao = ContactDao();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfer"),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: [],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data as List<Contact>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];
                  return _ContactItem(
                    contact,
                    onDelete: () => {
                      showDialog(
                          context: context,
                          builder: (context) => DeleteContactDialog(
                                _deleteText,
                                onConfirm: () {
                                  setState(() {
                                    _dao.delete(contact);
                                  });
                                },
                              ))
                    },
                    onUpdate: () => _updateItem(context, contact),
                    onClick: () => _newTransaction(context, contact),
                  );
                },
                itemCount: contacts.length,
              );
          }
          return Text("Unknow ERROR");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _newItem(context);
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  _updateItem(BuildContext context, Contact contact) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => ContactsUpdate(contact),
          ),
        )
        .then(
          (value) => setState(() {}),
        );
  }

  _newItem(BuildContext context) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => ContactsForm(),
          ),
        )
        .then(
          (value) => setState(() {}),
        );
  }

  _newTransaction(BuildContext context, Contact contact) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransactionForm(contact),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;
  final Function? onDelete;
  final Function? onUpdate;
  final Function? onClick;

  _ContactItem(
    this.contact, {
    @required this.onDelete,
    @required this.onUpdate,
    @required this.onClick,
  })  : assert(onDelete != null),
        assert(onClick != null),
        assert(onUpdate != null);

  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick!(),
        trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: () {
                onDelete!();
              },
              child: Icon(Icons.delete),
            ),
          ),
          InkWell(
            onTap: () {
              onUpdate!();
            },
            child: Icon(Icons.edit),
          ),
        ]),
        title: Text(
          contact.name,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
