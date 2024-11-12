import 'package:flutter/material.dart';

class Flappy extends StatelessWidget {
  const Flappy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      height: 100,
      width: 100,
      child: Image.asset(
        'lib/images/f.png',
      ),
    );
  }
}
