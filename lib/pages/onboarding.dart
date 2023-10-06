import 'package:bprcf/pages/intro/page1.dart';
import 'package:bprcf/pages/intro/page2.dart';
import 'package:bprcf/pages/intro/page3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //controller
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(controller: _controller, children: [
            IntroPage1(),
            // IntroPage2(),
            // IntroPage3(),
          ]),
          // Container(
          //     alignment: Alignment(0, 0.9),
          //     child: SmoothPageIndicator(
          //       controller: _controller,
          //       count: 3,
          //     )),
        ],
      ),
    );
  }
}
