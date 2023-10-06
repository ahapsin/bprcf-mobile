import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, 0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Selamat Datang di BPRCF",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          Image.asset(
            "assets/bitmap.png",
            scale: 2,
          ),
          Text(
            "PT Bank Perkreditan Rakyat Cahaya Fajar berizin dan diawasi oleh Otoritas Jasa Keuangan (OJK)",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
