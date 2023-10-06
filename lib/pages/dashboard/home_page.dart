import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class HomePageDash extends StatefulWidget {
  const HomePageDash({super.key});

  @override
  State<HomePageDash> createState() => _HomePageDashState();
}

class _HomePageDashState extends State<HomePageDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(child: Text('Rp.')),
          actions: [
            Container(
              width: 58,
              child: PopupMenuButton(
                icon: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9_efBVwFESnYhQhgAUtA1cNfSDNGYWA6H3Q&usqp=CAU"),
                  backgroundColor: Colors.red,
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
            )
          ],
        ),
      ),
      backgroundColor: Colors.indigo.shade50,
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.indigo.shade800,
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.amberAccent,
            ),
          )
        ],
      ),
    );
  }
}
