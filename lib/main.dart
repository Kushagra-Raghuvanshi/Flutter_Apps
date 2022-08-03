import 'package:flutter/material.dart';
import './frame.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Frame(),
    ));
  }
}
