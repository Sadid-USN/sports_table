import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
// Import for iOS features.
import 'dart:async';

class TheSportsDbPage extends StatefulWidget {
  final Future<WebViewController>? webViewControllerFuture;
  const TheSportsDbPage({Key? key, this.webViewControllerFuture})
      : super(key: key);

  @override
  State<TheSportsDbPage> createState() => _TheSportsDbPageState();
}

class _TheSportsDbPageState extends State<TheSportsDbPage> {
  WebViewController controller = WebViewController()
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
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://www.thesportsdb.com/'));

  goBack() {
    return controller.goBack();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool? result = await goBack();
        result ??= false;
        return result;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              WebViewWidget(
                controller: controller,
              ),
              IconButton(
                  onPressed: () {
                    controller.goBack();
                  },
                  icon: const Icon(Icons.arrow_back_ios))
            ],
          ),
        ),
      ),
    );
  }
}
