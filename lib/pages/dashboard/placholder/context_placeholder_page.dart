import 'package:flutter/material.dart';

class ContextPlaceholder extends StatelessWidget {
  const ContextPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('context'),
      ),
    );
  }
}
