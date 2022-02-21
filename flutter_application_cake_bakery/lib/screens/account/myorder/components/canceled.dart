import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/database/db_helper.dart';
import 'package:flutter_application_cake_bakery/screens/account/myorder/provider/invoice_provider.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class Canceled extends StatefulWidget {
  const Canceled({Key? key}) : super(key: key);

  @override
  State<Canceled> createState() => _CanceledState();
}

class _CanceledState extends State<Canceled> {
  final userr = DBHelper.instance.userr;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    print(userr.id);
    final invoices = Provider.of<InvoiceProvider>(context, listen: false);
    invoices.getInvoiceByAccountAndStatus(context, userr.id, 4);
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
    // return ListView(
    //   children: const [
    //     Product(
    //         text: 'Lý do hủy :',
    //         time: 'abcd',
    //         image: '3.png',
    //         productname: 'CUPCAKE',
    //         price: '30000',
    //         totalPrice: '1'
    //     ),
    //     SizedBox(height: kDefaultPadding/2),
    //     Product(
    //         text: 'Lý do hủy :',
    //         time: 'abcde',
    //         image: '3.png',
    //         productname: 'CUPCAKE',
    //         price: '30000',
    //         totalPrice: '1'
    //     ),
    //   ],
    // );
  }
}
