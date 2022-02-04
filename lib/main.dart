import 'package:flutter/material.dart';
import 'package:galaxy/pages/Ditils.dart';
import 'package:galaxy/pages/HomePage.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'detail': (context) => Details(),
      },
    ),
  );
}
