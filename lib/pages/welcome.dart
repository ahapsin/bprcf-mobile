import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: CircularProgressIndicator(
                    color: Colors.indigo[800],
                    strokeWidth: 5,
                  ),
                ),
                Text(
                  "PT Bank Perkreditan Rakyat Cahaya Fajar berizin dan diawasi oleh Otoritas Jasa Keuangan (OJK)",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
