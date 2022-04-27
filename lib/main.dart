import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_api/ui/home.dart';

Future main() async {
  await dotenv.load(fileName: 'dotenv');
  runApp(MaterialApp(
    home: Home(),
  ));
}