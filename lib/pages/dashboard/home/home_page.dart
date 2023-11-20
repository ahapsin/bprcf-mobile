import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Container(
          decoration: BoxDecoration(
              //color: Colors.indigo.shade800,
              image: DecorationImage(
                image: AssetImage('assets/backdrop.png'),
                fit: BoxFit.cover,
              ),
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/cf.png',
                      scale: 3,
                    ),
                    PopupMenuButton(
                      icon: SizedBox(
                        height: double.infinity,
                        width: 60,
                        child: Container(
                          color: Colors.white,
                          child: Text('as'),
                        ),
                      ),
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem<String>(
                            value: '1',
                            child: Text('1'),
                          ),
                          PopupMenuItem<String>(
                            value: '2',
                            child: Text('2'),
                          ),
                        ];
                      },
                    ),
                  ],
                ),
                Text(
                  '0011002933',
                  
                ),
                Text(
                  'SETIADI SIDARTA',
                  style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
