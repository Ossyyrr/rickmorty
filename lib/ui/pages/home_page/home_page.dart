import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/characters'),
        child: const Text('Characters'),
      )),
    ));
  }
}
