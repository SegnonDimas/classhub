import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/app_text.dart';

class ClassResultsPage extends StatefulWidget {
  @override
  _ClassResultsPageState createState() => _ClassResultsPageState();
}

class _ClassResultsPageState extends State<ClassResultsPage> {
  late final WebViewController _controller;
  bool _isLoading = true; // Pour gérer l'affichage du loader

  @override
  void initState() {
    super.initState();
    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: (String url) {
                print("🔄 Début du chargement : $url");
                setState(() {
                  _isLoading = true; // Affiche le loader
                });
              },
              onPageFinished: (String url) {
                print("✅ Page chargée : $url");
                setState(() {
                  _isLoading = false; // Cache le loader
                });
              },
              onWebResourceError: (WebResourceError error) {
                print("❌ Erreur WebView : ${error.description}");
                setState(() {
                  _isLoading = false; // Cache le loader en cas d'erreur
                });
              },
            ),
          )
          ..loadRequest(Uri.parse("https://eresultat.ifri-uac.bj"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: "Consutez vos résultats",
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
        foregroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ), // Loader tant que la page n'est pas chargée
        ],
      ),
    );
  }
}
