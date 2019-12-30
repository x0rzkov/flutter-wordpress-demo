import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'main.dart';

class InAppWebViewExampleScreen extends StatefulWidget {
  @override
  _InAppWebViewExampleScreenState createState() =>
      new _InAppWebViewExampleScreenState();
}

class _InAppWebViewExampleScreenState extends State<InAppWebViewExampleScreen> {
  InAppWebViewController webView;
  String url = "";
  double progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("InAppWebView")
        ),
        drawer: myDrawer(context: context),
        body: SafeArea(
            child: Column(children: <Widget>[
              Container(
                  padding: EdgeInsets.all(0.0),
                  child: progress < 1.0
                      ? LinearProgressIndicator(value: progress)
                      : Container()),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                  child: InAppWebView(
                    initialUrl: "https://dev.eedama.org/",
                    //initialFile: "assets/index.html",
                    initialHeaders: {},
                    initialOptions: InAppWebViewWidgetOptions(
                        crossPlatform: InAppWebViewOptions(
                          debuggingEnabled: true,
                        )
                    ),
                    onWebViewCreated: (InAppWebViewController controller) {
                      webView = controller;
                    },
                    onLoadStart: (InAppWebViewController controller, String url) {
                      print("onLoadStart $url");
                      setState(() {
                        this.url = url;
                      });
                    },
                    onLoadStop: (InAppWebViewController controller, String url) async {
                      print("onLoadStop $url");
                      setState(() {
                        this.url = url;
                      });
                    },
                    onProgressChanged: (InAppWebViewController controller, int progress) {
                      setState(() {
                        this.progress = progress / 100;
                      });
                    },
                    onUpdateVisitedHistory: (InAppWebViewController controller, String url, bool androidIsReload) {
                      print("onUpdateVisitedHistory $url");
                      setState(() {
                        this.url = url;
                      });
                    },
                  ),
                ),
              ),
            ]))
    );
  }
}