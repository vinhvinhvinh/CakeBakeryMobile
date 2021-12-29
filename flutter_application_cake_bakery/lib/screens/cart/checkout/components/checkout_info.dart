import 'package:flutter/material.dart';

import '../../../../constant.dart';

class CheckoutInfo extends StatefulWidget {
  CheckoutInfo({Key? key}) : super(key: key);

  @override
  _CheckoutInfoState createState() => _CheckoutInfoState();
}

class _CheckoutInfoState extends State<CheckoutInfo> {
  var addressShippingController = TextEditingController();
  var phoneShippingController = TextEditingController();

  @override
  void dispose() {
    //Cleanup
    addressShippingController.dispose();
    phoneShippingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nếu bạn đang ở đâu đó khác ?:',
              style: myStyle(15, Colors.grey.shade500, FontWeight.normal)),
          const SizedBox(height: 10),
          userInfoTextField(
              addressShippingController,
              'Địa chỉ nhận hàng',
              TextCapitalization.characters,
              1,
              const Icon(Icons.home_work_rounded),
              TextInputType.text),
          const SizedBox(height: 50),
          userInfoTextField(
              phoneShippingController,
              'Số điện thoại người nhận',
              TextCapitalization.characters,
              1,
              const Icon(Icons.phone),
              TextInputType.phone),
        ],
      ),
    );
  }

  TextField userInfoTextField(
      TextEditingController txtController,
      String fieldHint,
      TextCapitalization txtCapitalization,
      int fieldLine,
      Icon icon,
      TextInputType keyboardType) {
    return TextField(
      controller: txtController,

      maxLines: fieldLine, //can't null
      textCapitalization: txtCapitalization,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: fieldHint,
        suffixIcon: icon,
      ),
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
    );
  }
}
