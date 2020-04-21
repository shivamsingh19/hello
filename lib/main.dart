import 'package:flutter/material.dart';
import 'package:hello/ui/fuelform.dart';

void main() => runApp(new HelloFlutterApp());

class HelloFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Trip Cost Calculator",
      home: FuelForm(),
    );
  }
}
