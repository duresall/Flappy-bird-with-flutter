import 'package:flutter/material.dart';

class Obstacle extends StatelessWidget {
  final double size;

  const Obstacle({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: size,
      width: 60,
    );
  }
}
