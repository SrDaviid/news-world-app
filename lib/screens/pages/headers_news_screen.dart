import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderNewsScreen extends StatelessWidget {
  static const name = 'headers-screen';
  const HeaderNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Headers',
          style: GoogleFonts.nunito(
              fontWeight: FontWeight.w800, color: Colors.white, fontSize: 24),
        ),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
