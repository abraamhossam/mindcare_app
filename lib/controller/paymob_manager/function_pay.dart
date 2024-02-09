import 'package:url_launcher/url_launcher.dart';
import 'paymob_manager.dart';

Future<void> pay() async {
  PaymobManager().getPaymentKey(10, "EGP").then((String paymentKey) {
    launchUrl(
      Uri.parse(
          "https://accept.paymob.com/api/acceptance/iframes/819235?payment_token=$paymentKey"),
    );
  });
}
