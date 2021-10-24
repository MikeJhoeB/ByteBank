import 'dart:convert';

import 'package:bytebank2/models/transaction.dart';
import 'package:http/http.dart';

import '../web_client.dart';

class TransactionWebClient {
  Future<List<Transactions>> findAll() async {
    final Response response =
        await client.get(Uri.parse(base_url)).timeout(Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transactions.fromJson(json))
        .toList();
  }

  Future<Transactions> save(Transactions transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());
    final Response response = await client.post(Uri.parse(base_url),
        headers: {
          "Content-type": "application/json",
          "password": password,
        },
        body: transactionJson);
    return Transactions.fromJson(jsonDecode(response.body));
  }
}
