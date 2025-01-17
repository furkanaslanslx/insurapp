import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewDetail extends StatefulWidget {
  final String pageTitle;
  const WebviewDetail({super.key, required this.pageTitle});

  @override
  State<WebviewDetail> createState() => _WebviewDetailState();
}

class _WebviewDetailState extends State<WebviewDetail> {
  final String baseUrl = 'https://www.arexsigorta.com.tr/tr-TR/';
  late String url;
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    String formattedTitle = widget.pageTitle.toLowerCase().replaceAll(' ', '-');
    String formattedUrl = '$baseUrl$formattedTitle';
    url = formattedUrl
        .replaceAll('ü', 'u')
        .replaceAll('Ü', 'U')
        .replaceAll('ç', 'c')
        .replaceAll('Ç', 'C')
        .replaceAll('ş', 's')
        .replaceAll('Ş', 'S')
        .replaceAll('ğ', 'g')
        .replaceAll('Ğ', 'G')
        .replaceAll('ı', 'i')
        .replaceAll('İ', 'I')
        .replaceAll('ö', 'o')
        .replaceAll('Ö', 'O');
    switch (url) {
      case 'https://www.arexsigorta.com.tr/tr-TR/genisletilmis-kasko':
        url = 'https://www.arexsigorta.com.tr/tr-TR/genisletilmis-kasko-sigortasi';
        break;
      case 'https://www.arexsigorta.com.tr/tr-TR/siber-guvenlik-sigortasi':
        url = 'https://www.arexsigorta.com.tr/tr-TR/siber-guvenlik-sigortas%C4%B1';
        break;
      case 'https://www.arexsigorta.com.tr/tr-TR/montaj-all-risk-sigortasi':
        url = 'https://www.arexsigorta.com.tr/tr-TR/montaj-all-risks-sigortasi';
        break;
      default:
    }
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith(url)) {
            return NavigationDecision.navigate;
          } else {
            return NavigationDecision.prevent;
          }
        },
      ))
      ..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        padding: const EdgeInsetsDirectional.only(start: 0),
        middle: Text(widget.pageTitle),
        leading: CupertinoNavigationBarBackButton(
          color: Colors.blue,
          previousPageTitle: 'Geri',
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
