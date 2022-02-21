import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/database/db_helper.dart';
import 'package:flutter_application_cake_bakery/screens/account/myorder/provider/invoice_provider.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class WattingReceive extends StatefulWidget {
  const WattingReceive({Key? key}) : super(key: key);

  @override
  State<WattingReceive> createState() => _WattingReceiveState();
}

class _WattingReceiveState extends State<WattingReceive> {
  final userr = DBHelper.instance.userr;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    print(userr.id);
    final invoices = Provider.of<InvoiceProvider>(context, listen: false);
    invoices.getInvoiceByAccountAndStatus(context, userr.id, 2);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<InvoiceProvider>(builder: (context, state, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return Product(
            image: state.lstInvoiceByAccountIdAndStatus[index].image.toString(),
            productname: state.lstInvoiceByAccountIdAndStatus[index].productName.toString(),
            price: state.lstInvoiceByAccountIdAndStatus[index].price,
            totalPrice: state.lstInvoiceByAccountIdAndStatus[index].total,
            time: state.lstInvoiceByAccountIdAndStatus[index].issueDate,
            text: 'Đã đặt', quantity: state.lstInvoiceByAccountIdAndStatus[index].quantity,
          );
        },
        itemCount: state.lstInvoiceByAccountIdAndStatus.length,
      );
    });
  }
}