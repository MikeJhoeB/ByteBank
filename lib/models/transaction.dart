import 'package:bytebank2/models/contact.dart';

class Transactions {
  final double? value;
  final Contact contact;

  Transactions(
      this.value,
      this.contact,
      );

  Transactions.fromJson(Map<String, dynamic> json) :
      value = json["value"],
      contact = Contact.fromJson(json["contact"]);

  Map<String, dynamic> toJson() =>
      {
        'value' : value,
        'contact' : contact.toJson(),
      };

  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }

}