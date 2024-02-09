import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

import '../../constants.dart';
import '../../view/widgets/choose_payment.dart';


class PaypalWay extends StatefulWidget {
  const PaypalWay({super.key});

  @override
  State<PaypalWay> createState() => _PaypalWayState();
}

class _PaypalWayState extends State<PaypalWay> {
  @override
  Widget build(BuildContext context) {
    return ChoosePayment(
      image: KConstants.imagePaypal,
      onTap: () async {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => PaypalCheckout(
              sandboxMode: true,
              clientId: KConstants.clientIdpaypal,
              secretKey: KConstants.secretKeypaypal,
              returnURL: "success.snippetcoder.com",
              cancelURL: "cancel.snippetcoder.com",
              transactions: const [
                {
                  "amount": {
                    "total": '70',
                    "currency": "USD",
                    "details": {
                      "subtotal": '70',
                      "shipping": '0',
                      "shipping_discount": 0
                    }
                  },
                  "description": "The payment transaction description.",
                  "item_list": {
                    "items": [
                      {
                        "name": "Apple",
                        "quantity": 4,
                        "price": '5',
                        "currency": "USD"
                      },
                      {
                        "name": "Pineapple",
                        "quantity": 5,
                        "price": '10',
                        "currency": "USD"
                      }
                    ],
                  }
                }
              ],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                print("onSuccess: $params");
              },
              onError: (error) {
                print("onError: $error");
                Navigator.pop(context);
              },
              onCancel: () {
                print('cancelled:');
              },
            ),
          ),
        );
      },
    );
  }
}
