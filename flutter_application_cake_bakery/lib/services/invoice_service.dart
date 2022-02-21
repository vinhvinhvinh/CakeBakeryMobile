import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_cake_bakery/base_url.dart';
import 'package:flutter_application_cake_bakery/models/invoice.dart';
import 'package:http/http.dart' as http;

//Product By ProductType
Future<List<Invoice>> getInvoiceByAccountIdAndStatus(context, accountId, status) async {
  List<Invoice> invoices = [];

  try {
    final response = await http.get(
      Uri.parse(invoiceUrl + '/$accountId/$status'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
print(item);
      invoices = (item as List).map((prod) => Invoice.fromJson(prod)).toList();
    }
  } catch (e) {
    rethrow;
  }
  //print(products);
  return invoices;
}
