import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/models/invoice.dart';
import 'package:flutter_application_cake_bakery/services/invoice_service.dart';

class InvoiceProvider extends ChangeNotifier {
  List<Invoice> lstInvoiceByAccountIdAndStatus=[];
  bool loading = false;
  getInvoiceByAccountAndStatus(context,accountId, status) async{
    loading = true;
    lstInvoiceByAccountIdAndStatus=await getInvoiceByAccountIdAndStatus(context,accountId,status);
    loading = false;
    notifyListeners();
  }
}
