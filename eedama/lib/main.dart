import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_inappwebview_example/in_app_webiew_example.screen.dart';
import 'package:flutter_inappwebview_example/src/view_models/app_key.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';

// InAppLocalhostServer localhostServer = new InAppLocalhostServer();

Future main() async {
  // await localhostServer.start();
  runApp(new MyApp());
}



Drawer myDrawer({@required BuildContext context}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Eedama world'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('Eedama web'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        ListTile(
          title: Text('Eedama posts'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/posts');
          },
        ),

      ],
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Keys()),
      ],
      child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => InAppWebViewExampleScreen(),
            '/posts': (context) => HawalnirHome(),
          }
      ),
    );
  }
}