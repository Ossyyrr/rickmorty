import 'package:flutter/material.dart';
import 'package:rickmorty/app.dart';
import 'package:rickmorty/data/api/api.dart';

void main() {
  Api.configureDio();

  runApp(const App());
}
