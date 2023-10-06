import 'dart:async';

import 'package:bprcf/pages/intro/auth_page/signin_signup.dart';
import 'package:bprcf/pages/welcome.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration =  new Duration(seconds: 6);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SignInSignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return const WelcomePage();
  }
}
