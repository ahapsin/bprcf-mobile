import 'package:bprcf/pages/splash.dart';
import 'package:bprcf/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {   
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Auth()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
