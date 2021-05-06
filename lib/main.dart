import 'package:flutter/material.dart';
import 'package:myapp/pages/Initial_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Keep Notes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Initialpage(
      titletext: '',
      desctext: '',
      bgcolors: '',
      hours: '',
      minutes: '',
    );
  }
}
