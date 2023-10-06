import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
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
          preferredSize: Size.fromHeight(100.0),
          child: Center(Container(
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
          )),
        ),
        backgroundColor: Colors.indigo.shade800,
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                ),
              ),
            ),
          ],
        ));
  }
}
