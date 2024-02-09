import 'package:flutter/material.dart';
import 'package:mindcare_app/view/widgets/choose_payment.dart';

import '../../constants.dart';
import '../../controller/paymob_manager/function_pay.dart';
import '../../controller/paypal_manager/paypal_manager.dart';
// import '../paymob_manager/function_pay.dart';
// import '../paypal_manager/paypal_manager.dart';

class ChooseMethodeToPayment extends StatefulWidget {
  const ChooseMethodeToPayment({super.key});

  @override
  State<ChooseMethodeToPayment> createState() => _ChooseMethodeToPaymentState();
}

class _ChooseMethodeToPaymentState extends State<ChooseMethodeToPayment> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const PaypalWay(),
          const SizedBox(width: 40),
          ChoosePayment(
              image: KConstants.imagePaymob,
              // image: KConstants.imagePaymob2,
              onTap: () async {
                pay();
              })
        ],
      ),
    );
  }
}
