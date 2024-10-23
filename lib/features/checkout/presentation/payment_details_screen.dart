import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentDetailsScreen extends StatefulWidget {
  final String paymentKey;
  const PaymentDetailsScreen({super.key, required this.paymentKey});

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            if (url.contains('success')) {
              Navigator.of(context).pop({'status': 'success'});
            } else if (url.contains('failure')) {
              Navigator.of(context).pop({'status': 'failure'});
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(
          "https://accept.paymob.com/api/acceptance/iframes/858538?payment_token=${widget.paymentKey}"));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _webViewController);
  }
}
