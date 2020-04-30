import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/screens/detect_screen.dart';


class Cam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Detect Room Color',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DetectScreen(

          title: 'Detecting Plant'),
    );
  }
}