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
          child: Center(
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PopupMenuButton(
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
                ],
              ),
            ),
          ),
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
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                child: Text(style: TextStyle(
                                  fontSize: 25.0,
                                  height: 1.5
                                ),'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
                              ),
                            ),
                          ),
                ),
              ),
            ),
          ],
        ));
  }
}
