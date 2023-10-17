import 'package:flutter/material.dart';

class TermPage extends StatelessWidget {
  const TermPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Terms and Conditions'),
          backgroundColor: Colors.indigo.shade800,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Container(
                color: Colors.amber,
                height: double.infinity,
                child: SingleChildScrollView(
                    child: Column(
                  children: [],
                )),
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.indigo[800],
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Ajukan Sekarang",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ),
            )
          ],
        ));
  }
}
