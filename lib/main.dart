import 'package:flutter/material.dart';

// main
// возрашяет runApp
// передаеи виджет class
void main() => runApp(CCTracker());


// class widget
// Все состоит из виджета
class CCTracker extends StatelessWidget{

  // каждый виджет переопределяет функцию build
  // возврашяет MaterialApp базавая оболочка
  // BuildContext
  @override
  Widget build(BuildContext context) {
    //
    return MaterialApp(
      title: 'CC Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Text('Hi'),
    );
  }
}
