import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const route = '/home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('home'),
    );
  }
}
