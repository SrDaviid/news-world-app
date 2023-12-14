import 'package:flutter/material.dart';

class HeaderNewsScreen extends StatelessWidget {
  static const name = 'headers-screen';
  const HeaderNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Text('HEADERS'),
      ),
    );
  }
}
