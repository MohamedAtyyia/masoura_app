import 'package:certivicate/core/style/app_color.dart';
import 'package:certivicate/core/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWithCard extends StatefulWidget {
  const PaymentWithCard({super.key, required this.url});
  final String url;

  @override
  State<PaymentWithCard> createState() => _PaymentWithCardState();
}

class _PaymentWithCardState extends State<PaymentWithCard> {
  late WebViewController controller;
  var loadingPage = 0;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(widget.url)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.kPeimeryColor,
        title: Text(
          'Payment With Crd',
          style: Style.textStyle16,
        ),
      ),
      body: WebViewWidget(controller: controller),
    ));
  }
}
