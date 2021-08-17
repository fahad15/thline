import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:the_line/screens/googleSheet/googleSeeht.dart';
import 'package:the_line/screens/home/home_screen.dart';
import 'package:the_line/screens/main_theming_and_stat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: // GooglSheet(),
          MainThemingAndStateManagementApp(), //shart_screen
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _onPressed(BuildContext context, Widget child) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => child),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
